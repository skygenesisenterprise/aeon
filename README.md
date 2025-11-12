<div align="center">

# Aeon

OpenCode is a powerful AI-powered development tool that brings intelligent code assistance directly to your terminal. Designed for developers who want to accelerate their workflow with AI, OpenCode provides seamless integration with multiple projects, intelligent file management, and context-aware code generation.

</div>

## 🚀 Features

- **Terminal-Native**: Built specifically for terminal-based development workflows
- **Multi-Project Support**: Manage sessions across multiple projects and worktrees
- **AI-Powered Assistance**: Intelligent code generation, refactoring, and problem-solving
- **Real-time Collaboration**: Share sessions and work together with your team
- **Cross-Platform**: Available as CLI tool, desktop app, and web interface
- **Extensible Architecture**: Plugin system for custom integrations and workflows
- **Version Control Integration**: Native Git support with GitHub integration
- **Multiple AI Providers**: Support for various AI models and providers

## 📦 Architecture

Aeon is built as a monorepo with the following key components:

### Core Packages

- **`aeon`** - Main CLI application and terminal interface
- **`ui`** - Reusable UI components built with SolidJS
- **`sdk`** - JavaScript/TypeScript SDK for integration
- **`function`** - Cloudflare Workers backend API

### Applications

- **`desktop`** - Native desktop application (Electron/Tauri style)
- **`console`** - Web-based management console
- **`web`** - Documentation and marketing website
- **`slack`** - Slack integration bot

### Extensions

- **`extensions/zed`** - Zed editor integration
- **`vscode`** - Visual Studio Code extension

## 🛠️ Technology Stack

- **Runtime**: Bun (JavaScript runtime)
- **Language**: TypeScript
- **Frontend**: SolidJS, TailwindCSS
- **Backend**: Hono (Cloudflare Workers)
- **Infrastructure**: SST (Serverless Stack)
- **Database**: PlanetScale
- **AI Integration**: Multiple providers (OpenAI, Anthropic, etc.)
- **Version Control**: Git with GitHub integration

## 🚀 Quick Start

### Installation

#### Option 1: Docker (Recommended)

```bash
# Pull the Docker image
docker pull skygenesisenterprise/aeon:latest

# Run Aeon
docker run -it --rm skygenesisenterprise/aeon:latest

# Or mount your project directory
docker run -it --rm -v $(pwd):/workspace -w /workspace skygenesisenterprise/aeon:latest run
```

#### Option 2: Package Manager

```bash
# Install via npm
npm install -g @skygenesisenterprise/aeon

# Or via bun
bun install -g @skygenesisenterprise/aeon

# Or download the binary
curl -fsSL https://aeon.skygenesisenterprise.com/install | sh
```

### Basic Usage

```bash
# Start a new coding session
aeon run

# Initialize in a specific directory
aeon run ./my-project

# List available models
aeon models

# Check authentication status
aeon auth status
```

#### Docker Usage

```bash
# Build the Docker image
bun run docker:build

# Run with Docker
bun run docker:run

# Push to registry
bun run docker:push

# Run with project mounted
docker run -it --rm -v $(pwd):/workspace -w /workspace skygenesisenterprise/aeon:latest run
```

### Development Setup

```bash
# Clone the repository
git clone https://github.com/skygenesisenterprise/aeon.git
cd aeon

# Install dependencies
bun install

# Run in development mode
bun run dev

# Run tests
bun run test

# Type checking
bun run typecheck
```

## 📚 Documentation

- **[Getting Started](https://wiki.skygenesisenterprise.com/aeon)** - Learn the basics
- **[API Reference](https://wiki.skygenesisenterprise.com/aeon/api)** - SDK and API documentation
- **[CLI Reference](https://wiki.skygenesisenterprise.com/aeon/cli)** - Complete command reference
- **[Plugins](https://wiki.skygenesisenterprise.com/aeon/plugins)** - Build custom integrations

## 🔧 Configuration

OpenCode can be configured through:

- **Environment variables** for API keys and settings
- **Configuration files** (`.opencode.json`) for project-specific settings
- **CLI flags** for runtime configuration

Example configuration:

```json
{
  "model": "gpt-4",
  "provider": "openai",
  "workspace": "./src",
  "exclude": ["node_modules", ".git"]
}
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Workflow

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Submit a pull request

## 🆘 Support

- **[Documentation](https://wiki.skygenesisenterprise.com)** - Comprehensive guides and API reference
- **[GitHub Issues](https://github.com/skygenesisenterprise/aeon/issues)** - Bug reports and feature requests
- **[Discord Community](https://skygenesisenterprise.com/discord)** - Chat with the community
- **[Email Support](mailto:support@skygenesisenterprise.com)** - Enterprise support

## 🌟 Roadmap

- [ ] Enhanced multi-language support
- [ ] Advanced debugging capabilities
- [ ] Team collaboration features
- [ ] Performance optimizations
- [ ] Additional AI provider integrations
- [ ] Mobile applications

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

<div align="center">

**Built with ❤️ by the Sky Genesis Enterprise team**

</div>
