# Use the official Bun image as base
FROM oven/bun:1.3.2-alpine AS base

# Install dependencies only when needed
FROM base AS deps
WORKDIR /app

# Copy package files first for better caching
COPY package.json bun.lock ./
COPY packages/opencode/package.json ./packages/opencode/
COPY packages/ui/package.json ./packages/ui/
COPY packages/sdk/js/package.json ./packages/sdk/js/
COPY packages/function/package.json ./packages/function/
COPY packages/console/app/package.json ./packages/console/app/
COPY packages/desktop/package.json ./packages/desktop/
COPY packages/web/package.json ./packages/web/
COPY packages/slack/package.json ./packages/slack/
COPY packages/script/package.json ./packages/script/
COPY packages/plugin/package.json ./packages/plugin/
COPY packages/console/core/package.json ./packages/console/core/
COPY packages/console/mail/package.json ./packages/console/mail/
COPY packages/console/resource/package.json ./packages/console/resource/

# Copy patches directory
COPY patches ./patches

# Install dependencies
RUN bun install

# Build the application
FROM base AS builder
WORKDIR /app

# Copy dependencies
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/packages/opencode/node_modules ./packages/opencode/node_modules
COPY --from=deps /app/packages/ui/node_modules ./packages/ui/node_modules
COPY --from=deps /app/packages/sdk/js/node_modules ./packages/sdk/js/node_modules
COPY --from=deps /app/packages/function/node_modules ./packages/function/node_modules
COPY --from=deps /app/packages/console/app/node_modules ./packages/console/app/node_modules
COPY --from=deps /app/packages/desktop/node_modules ./packages/desktop/node_modules
COPY --from=deps /app/packages/web/node_modules ./packages/web/node_modules
COPY --from=deps /app/packages/slack/node_modules ./packages/slack/node_modules
COPY --from=deps /app/packages/script/node_modules ./packages/script/node_modules
COPY --from=deps /app/packages/plugin/node_modules ./packages/plugin/node_modules
COPY --from=deps /app/packages/console/core/node_modules ./packages/console/core/node_modules
COPY --from=deps /app/packages/console/mail/node_modules ./packages/console/mail/node_modules
COPY --from=deps /app/packages/console/resource/node_modules ./packages/console/resource/node_modules

# Copy source code
COPY . .

# Install git for build script
RUN apk add --no-cache git

# Initialize git repository for build script
RUN git init && git config user.email "build@docker" && git config user.name "Docker Build"

# Build the opencode CLI
RUN cd packages/opencode && OPENCODE_CHANNEL=production bun run build

# Production image
FROM base AS runner
WORKDIR /app

# Create non-root user
RUN addgroup --system --gid 1001 bun && \
    adduser --system --uid 1001 bun

# Copy built CLI
COPY --from=builder --chown=bun:bun /app/packages/opencode/bin/opencode /usr/local/bin/opencode
COPY --from=builder --chown=bun:bun /app/packages/opencode/dist ./dist

# Set permissions
RUN chmod +x /usr/local/bin/opencode

# Switch to non-root user
USER bun

# Set environment variables
ENV NODE_ENV=production
ENV PATH="/usr/local/bin:${PATH}"

# Expose port (if needed for web interface)
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD opencode --version || exit 1

# Set entrypoint
ENTRYPOINT ["opencode"]
CMD ["--help"]