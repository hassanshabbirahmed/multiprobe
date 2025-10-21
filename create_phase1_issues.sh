#!/bin/bash
# Script to create all Phase 1 issues using GitHub CLI
# Run this from your local machine where gh is authenticated

set -e

REPO="hassanshabbirahmed/multiprobe"

echo "Creating Phase 1 Foundation issues for $REPO..."

# Documentation & Positioning

gh issue create --repo "$REPO" \
  --title "Complete README with value proposition, use cases, and examples" \
  --label "documentation,phase-1,priority-high" \
  --body "## Overview
As part of Phase 1 Foundation, we need to completely rewrite the README to clearly communicate Multiprobe's value proposition and positioning.

## Goals
- Clearly position Multiprobe as \"The Swiss Army Knife for HTTP Testing in Cloud-Native Environments\"
- Explain the value proposition: Deploy a fully-featured HTTP testing endpoint in seconds
- Include practical use cases for target audiences (Backend Devs, DevOps/SRE, QA Engineers)
- Provide clear installation and quick start examples
- Show Docker deployment examples

## Target Audiences to Address
1. Backend Developers - HTTP integration testing
2. DevOps/SRE Teams - Synthetic monitoring, K8s ingress testing
3. QA/Test Engineers - Mock services, load testing

## Success Criteria
- [ ] Clear value proposition in the opening paragraph
- [ ] Installation instructions (Docker, Go binary)
- [ ] Quick start guide with examples
- [ ] 5+ use case scenarios with code examples
- [ ] Links to further documentation
- [ ] Badges (build status, Docker pulls, Go version, license)

## Related
Part of Phase 1: Foundation (Q1 2026)
Reference: BUSINESS_STRATEGY_ROADMAP.md - Section 5"

echo "✓ Created Issue #1: README"

gh issue create --repo "$REPO" \
  --title "Create CONTRIBUTING.md for contributors" \
  --label "documentation,phase-1,community" \
  --body "## Overview
Establish clear contribution guidelines to make it easy for external contributors to participate in the project.

## Goals
- Lower the barrier to entry for new contributors
- Establish coding standards and conventions
- Define the pull request process
- Create a welcoming and inclusive environment

## Content to Include
- [ ] How to set up development environment
- [ ] Code style guidelines (Go formatting, linting)
- [ ] Testing requirements
- [ ] Pull request process and review expectations
- [ ] Code of conduct reference
- [ ] How to report bugs and request features
- [ ] Communication channels (Discussions, Issues)
- [ ] Recognition for contributors

## Success Criteria
- Document is clear and comprehensive
- First-time contributors can successfully set up and contribute
- Aligns with open source best practices

## Related
Part of Phase 1: Foundation (Q1 2026)
Target: Help achieve 10+ external contributors milestone"

echo "✓ Created Issue #2: CONTRIBUTING.md"

gh issue create --repo "$REPO" \
  --title "Write architectural decision records (ADRs)" \
  --label "documentation,phase-1,architecture" \
  --body "## Overview
Document key architectural decisions to help contributors understand the technical direction and rationale behind design choices.

## Goals
- Create a clear record of important technical decisions
- Help new contributors understand the architecture
- Provide context for future technical choices

## ADRs to Create
1. **ADR-001**: Choice of Go as primary language
2. **ADR-002**: HTTP router selection (Gorilla Mux vs alternatives)
3. **ADR-003**: Prometheus metrics integration approach
4. **ADR-004**: Docker-first deployment strategy
5. **ADR-005**: Future: Removal of Fyne UI in favor of web UI

## Format
Use standard ADR format:
- Title
- Status (Proposed, Accepted, Deprecated, Superseded)
- Context
- Decision
- Consequences

## Location
Create \`docs/adr/\` directory with numbered ADR files

## Success Criteria
- [ ] At least 3-5 ADRs documented
- [ ] Clear rationale for each decision
- [ ] Linked from main documentation

## Related
Part of Phase 1: Foundation (Q1 2026)"

echo "✓ Created Issue #3: ADRs"

gh issue create --repo "$REPO" \
  --title "Create comprehensive API documentation (OpenAPI/Swagger)" \
  --label "documentation,phase-1,api,enhancement" \
  --body "## Overview
Create complete API documentation using OpenAPI/Swagger specification to make it easy for developers to understand and use all endpoints.

## Goals
- Document all existing endpoints
- Provide interactive API documentation
- Enable automatic client generation
- Improve developer experience

## Endpoints to Document
- \`/\` - Welcome/info endpoint
- \`/healthz\` - Health check endpoint
- \`/readyz\` - Readiness check endpoint
- \`/metrics\` - Prometheus metrics endpoint
- \`/primetime\` - CPU load testing endpoint
- Future: Echo endpoint (from another Phase 1 task)
- Future: Configurable delay/status endpoints

## Implementation Options
1. **Option A**: Use Go annotations with swag/swaggo
2. **Option B**: Write OpenAPI spec manually
3. **Option C**: Use go-swagger

## Deliverables
- [ ] OpenAPI 3.0 specification file
- [ ] Interactive Swagger UI served at \`/docs\` or \`/swagger\`
- [ ] Example requests and responses for all endpoints
- [ ] Clear parameter descriptions

## Success Criteria
- All endpoints fully documented
- Interactive UI accessible
- Can generate client libraries from spec

## Related
Part of Phase 1: Foundation (Q1 2026)"

echo "✓ Created Issue #4: API Documentation"

gh issue create --repo "$REPO" \
  --title "Set up documentation site (GitHub Pages or multiprobe.dev)" \
  --label "documentation,phase-1,infrastructure,website" \
  --body "## Overview
Create a professional documentation website to serve as the central hub for all Multiprobe documentation, tutorials, and guides.

## Goals
- Centralize all documentation
- Improve discoverability and SEO
- Create a professional web presence
- Make documentation easy to navigate

## Options
1. **GitHub Pages** (free, easy setup)
   - Use Jekyll or Hugo
   - Deploy from \`docs/\` folder or \`gh-pages\` branch

2. **Custom domain** (multiprobe.dev)
   - More professional
   - Better branding
   - Requires domain purchase (~\$12/year)

3. **Documentation frameworks**
   - MkDocs with Material theme (popular for Go projects)
   - Docusaurus (modern, React-based)
   - Hugo (fast, Go-based)

## Content Structure
- Home / Introduction
- Getting Started / Quick Start
- Installation Guide
- API Reference (link to Swagger)
- Use Cases / Tutorials
- Architecture / ADRs
- Contributing Guide
- Roadmap
- Blog (for Phase 1 tutorial posts)

## Success Criteria
- [ ] Live documentation site accessible
- [ ] All existing docs migrated
- [ ] Search functionality
- [ ] Mobile responsive
- [ ] Fast load times
- [ ] Automated deployment on commit

## Related
Part of Phase 1: Foundation (Q1 2026)
Supports goal of excellent documentation"

echo "✓ Created Issue #5: Documentation Site"

# Core Features

gh issue create --repo "$REPO" \
  --title "Implement request echo endpoint with full header/body inspection" \
  --label "feature,phase-1,priority-high,api" \
  --body "## Overview
Implement a comprehensive request echo endpoint that returns detailed information about the incoming HTTP request, similar to httpbin.org but optimized for cloud-native debugging.

## Goals
- Provide developers with a tool to debug HTTP requests
- Show all request metadata (headers, body, query params, etc.)
- Enable testing of proxies, load balancers, and API gateways
- Differentiate from basic echo servers with enhanced features

## Features to Implement
- [ ] Echo request method (GET, POST, PUT, DELETE, etc.)
- [ ] Echo all request headers
- [ ] Echo query parameters
- [ ] Echo request body (with content-type detection)
- [ ] Echo client IP address (real IP, not proxy)
- [ ] Echo request timestamp
- [ ] Echo request URL and path
- [ ] Support for JSON, XML, form data, multipart
- [ ] Pretty-printed JSON response

## Endpoint Design
\`\`\`
GET/POST/PUT/DELETE /echo
\`\`\`

Response format:
\`\`\`json
{
  \"method\": \"POST\",
  \"url\": \"http://example.com/echo?foo=bar\",
  \"headers\": {
    \"User-Agent\": \"curl/7.64.1\",
    \"Content-Type\": \"application/json\"
  },
  \"query\": {
    \"foo\": \"bar\"
  },
  \"body\": \"raw body content\",
  \"client_ip\": \"192.168.1.1\",
  \"timestamp\": \"2026-01-15T10:30:00Z\"
}
\`\`\`

## Success Criteria
- [ ] All HTTP methods supported
- [ ] Handles large request bodies (up to 10MB)
- [ ] Properly detects and displays various content types
- [ ] Returns well-formatted JSON response
- [ ] Includes comprehensive tests
- [ ] Updated Prometheus metrics for endpoint usage

## Related
Part of Phase 1: Foundation (Q1 2026)
Core differentiation feature"

echo "✓ Created Issue #6: Echo Endpoint"

gh issue create --repo "$REPO" \
  --title "Add configurable response delays and status codes" \
  --label "feature,phase-1,enhancement,testing" \
  --body "## Overview
Add endpoints that allow clients to configure response delays and HTTP status codes, enabling testing of timeout handling, retry logic, and error scenarios.

## Goals
- Enable testing of client timeout handling
- Simulate slow network conditions
- Test error handling for various HTTP status codes
- Support chaos engineering scenarios

## Features to Implement

### 1. Delay Endpoint
\`\`\`
GET /delay/{seconds}
\`\`\`
- Waits for specified seconds (0-30) before responding
- Returns 200 OK with delay information
- Example: \`/delay/5\` waits 5 seconds

### 2. Status Code Endpoint
\`\`\`
GET /status/{code}
\`\`\`
- Returns specified HTTP status code
- Supports all valid HTTP status codes (100-599)
- Example: \`/status/404\` returns 404 Not Found

### 3. Combined Endpoint
\`\`\`
GET /delay/{seconds}/status/{code}
\`\`\`
- Combines delay and custom status code
- Example: \`/delay/3/status/500\` waits 3 seconds, returns 500

### 4. Random Delay Endpoint (Optional)
\`\`\`
GET /delay/random?min=1&max=5
\`\`\`
- Random delay within specified range
- Useful for chaos testing

## Response Format
\`\`\`json
{
  \"delayed_by\": 5.0,
  \"status_code\": 200,
  \"timestamp\": \"2026-01-15T10:30:00Z\"
}
\`\`\`

## Configuration Limits
- Maximum delay: 30 seconds (prevent abuse)
- Valid status codes: 100-599
- Timeout handling with context

## Success Criteria
- [ ] Delay endpoint with configurable seconds
- [ ] Status code endpoint for all valid codes
- [ ] Combined delay + status endpoint
- [ ] Input validation and error handling
- [ ] Prometheus metrics for delay and status usage
- [ ] Comprehensive tests
- [ ] Documentation with examples

## Related
Part of Phase 1: Foundation (Q1 2026)
Supports QA/Test Engineer use cases"

echo "✓ Created Issue #7: Delay and Status Endpoints"

gh issue create --repo "$REPO" \
  --title "Improve Prometheus metrics with better labels" \
  --label "feature,phase-1,observability,prometheus" \
  --body "## Overview
Enhance the existing Prometheus metrics implementation with better labels, additional metrics, and improved organization to support observability use cases.

## Goals
- Provide better visibility into Multiprobe usage
- Enable monitoring of endpoint performance
- Support SRE/DevOps observability requirements
- Follow Prometheus best practices

## Current State
- Basic Prometheus endpoint at \`/metrics\`
- Limited metrics exposed

## Improvements Needed

### 1. HTTP Request Metrics
\`\`\`
# Counter: Total HTTP requests
http_requests_total{method=\"GET\", endpoint=\"/echo\", status=\"200\"}

# Histogram: Request duration
http_request_duration_seconds{method=\"GET\", endpoint=\"/echo\"}

# Gauge: In-flight requests
http_requests_in_flight{endpoint=\"/echo\"}
\`\`\`

### 2. Custom Endpoint Metrics
\`\`\`
# Counter: Echo endpoint usage
multiprobe_echo_requests_total{content_type=\"application/json\"}

# Counter: Delay endpoint usage
multiprobe_delay_requests_total{delay_bucket=\"0-1s\"}

# Counter: Status code endpoint usage
multiprobe_status_requests_total{status_code=\"200\"}

# Histogram: Primetime CPU load duration
multiprobe_primetime_duration_seconds
\`\`\`

### 3. Application Metrics
\`\`\`
# Gauge: Go runtime info
go_info{version=\"1.21\"}

# Gauge: Application uptime
multiprobe_uptime_seconds

# Gauge: Build info
multiprobe_build_info{version=\"0.2.0\", commit=\"abc123\"}
\`\`\`

## Implementation
- Use \`prometheus/client_golang\` library
- Implement middleware for automatic HTTP metrics
- Add custom metrics for each endpoint
- Follow RED method (Rate, Errors, Duration)
- Follow USE method for resources (Utilization, Saturation, Errors)

## Success Criteria
- [ ] HTTP request metrics with labels (method, endpoint, status)
- [ ] Request duration histograms
- [ ] Custom metrics for each endpoint
- [ ] Build and version information exposed
- [ ] Metrics follow Prometheus naming conventions
- [ ] Documentation on available metrics
- [ ] Example Grafana dashboard JSON (optional)

## Related
Part of Phase 1: Foundation (Q1 2026)
Supports \"Observability Built-In\" differentiation"

echo "✓ Created Issue #8: Prometheus Metrics"

# Community & Infrastructure

gh issue create --repo "$REPO" \
  --title "Enable GitHub Discussions for community engagement" \
  --label "community,phase-1,infrastructure" \
  --body "## Overview
Enable and organize GitHub Discussions to provide a central place for community questions, feature requests, and general discussion.

## Goals
- Create a welcoming space for community interaction
- Reduce noise in GitHub Issues
- Enable Q&A and knowledge sharing
- Build community engagement

## Setup Tasks
- [ ] Enable GitHub Discussions in repository settings
- [ ] Create discussion categories:
  - 💬 General - General discussion about Multiprobe
  - 💡 Ideas - Feature ideas and suggestions
  - 🙏 Q&A - Questions and answers
  - 📣 Announcements - Project announcements
  - 🎉 Show and Tell - Share your Multiprobe use cases
  - 🐛 Troubleshooting - Help with issues
- [ ] Pin welcome message with community guidelines
- [ ] Pin FAQ discussion
- [ ] Link to Discussions from README

## Initial Content
- Welcome post explaining how to use Discussions
- FAQ with common questions
- Link to CONTRIBUTING.md for code contributions

## Success Criteria
- Discussions enabled and organized
- Clear category structure
- Welcome message posted
- Linked from main documentation

## Related
Part of Phase 1: Foundation (Q1 2026)
Target: Launch community presence"

echo "✓ Created Issue #9: GitHub Discussions"

gh issue create --repo "$REPO" \
  --title "Set up GitHub issue templates" \
  --label "community,phase-1,infrastructure,documentation" \
  --body "## Overview
Create comprehensive issue templates to make it easy for users to report bugs, request features, and ask questions in a structured way.

## Goals
- Streamline bug reporting process
- Gather necessary information upfront
- Improve issue quality
- Guide users to appropriate channels

## Templates to Create

### 1. Bug Report Template (\`.github/ISSUE_TEMPLATE/bug_report.md\`)
- Multiprobe version
- Go version
- Operating system / Platform
- Deployment method (Docker, binary, K8s)
- Steps to reproduce
- Expected behavior
- Actual behavior
- Logs/error messages
- Screenshots (if applicable)

### 2. Feature Request Template (\`.github/ISSUE_TEMPLATE/feature_request.md\`)
- Problem description
- Proposed solution
- Alternatives considered
- Use case
- Target audience
- Additional context

### 3. Documentation Issue Template (\`.github/ISSUE_TEMPLATE/documentation.md\`)
- Type of documentation (API, tutorial, guide, etc.)
- Current state
- Desired improvement
- Affected pages/sections

### 4. Question Template (\`.github/ISSUE_TEMPLATE/question.md\`)
- Redirect to GitHub Discussions for general questions
- Quick checklist (checked docs, searched existing issues)

### 5. Config File (\`.github/ISSUE_TEMPLATE/config.yml\`)
- Add link to Discussions
- Add link to documentation site
- Add link to Stack Overflow tag (future)

## Success Criteria
- [ ] All templates created and tested
- [ ] Clear and user-friendly
- [ ] Required fields marked appropriately
- [ ] Links to relevant documentation
- [ ] Automated labels assigned

## Related
Part of Phase 1: Foundation (Q1 2026)
Supports community building"

echo "✓ Created Issue #10: Issue Templates"

gh issue create --repo "$REPO" \
  --title "Set up GitHub pull request template" \
  --label "community,phase-1,infrastructure,documentation" \
  --body "## Overview
Create a pull request template to ensure contributors provide necessary information and follow the contribution process.

## Goals
- Standardize PR submissions
- Ensure quality and completeness
- Reduce review time
- Guide contributors

## Success Criteria
- [ ] PR template created at \`.github/PULL_REQUEST_TEMPLATE.md\`
- [ ] Clear and comprehensive
- [ ] Linked from CONTRIBUTING.md
- [ ] Includes all necessary sections

## Related
Part of Phase 1: Foundation (Q1 2026)
Target: 10+ external contributors"

echo "✓ Created Issue #11: PR Template"

gh issue create --repo "$REPO" \
  --title "Set up CI/CD pipeline with GitHub Actions" \
  --label "infrastructure,phase-1,priority-high,ci-cd" \
  --body "## Overview
Implement a comprehensive CI/CD pipeline using GitHub Actions to automate testing, building, and quality checks.

## Goals
- Automate testing on every PR and commit
- Ensure code quality and consistency
- Catch bugs early
- Streamline the development process

## Workflows to Implement

### 1. Test Workflow (\`.github/workflows/test.yml\`)
Runs on: PR, push to main
- [ ] Go code linting (golangci-lint)
- [ ] Go formatting check (gofmt)
- [ ] Unit tests with coverage
- [ ] Integration tests
- [ ] Race condition detection (\`go test -race\`)
- [ ] Test on multiple Go versions (1.21, 1.22, 1.23)
- [ ] Test on multiple platforms (Linux, macOS, Windows)

### 2. Build Workflow (\`.github/workflows/build.yml\`)
Runs on: PR, push to main
- [ ] Build Go binary for multiple platforms
- [ ] Build Docker image
- [ ] Verify Docker image can run
- [ ] Check binary size
- [ ] Store artifacts

### 3. Code Quality Workflow (\`.github/workflows/quality.yml\`)
Runs on: PR, push to main
- [ ] Code coverage reporting (codecov or coveralls)
- [ ] Security scanning (gosec)
- [ ] Dependency vulnerability scanning (govulncheck)
- [ ] License compliance check

### 4. Documentation Workflow (\`.github/workflows/docs.yml\`)
Runs on: push to main
- [ ] Build documentation site
- [ ] Deploy to GitHub Pages
- [ ] Check for broken links

## Status Badges
Add badges to README for:
- Build status
- Test coverage
- Go report card
- License
- Latest release

## Success Criteria
- [ ] All workflows implemented and passing
- [ ] Runs on PRs before merge
- [ ] Fast feedback (<5 minutes for basic checks)
- [ ] Status badges in README
- [ ] Branch protection rules enabled (require CI to pass)

## Related
Part of Phase 1: Foundation (Q1 2026)
Reference: BUSINESS_STRATEGY_ROADMAP.md - Immediate Actions"

echo "✓ Created Issue #12: CI/CD Pipeline"

gh issue create --repo "$REPO" \
  --title "Automated Docker builds and pushes to registry" \
  --label "infrastructure,phase-1,docker,ci-cd" \
  --body "## Overview
Automate Docker image building and publishing to container registries (Docker Hub and GitHub Container Registry) on releases and tags.

## Goals
- Automate container image releases
- Support multiple architectures (amd64, arm64)
- Version images appropriately
- Make deployment easy for users

## Implementation

### Workflow: \`.github/workflows/docker.yml\`

Triggers:
- Push to main branch (tag as \`latest\`)
- Release/tag creation (tag with version number)
- Manual workflow dispatch

Features:
- [ ] Multi-platform builds (linux/amd64, linux/arm64)
- [ ] Push to Docker Hub (docker.io)
- [ ] Push to GitHub Container Registry (ghcr.io)
- [ ] Semantic version tagging (v1.2.3, v1.2, v1, latest)
- [ ] Build metadata labels (version, commit SHA, build date)
- [ ] Use Docker buildx for efficient builds
- [ ] Layer caching for faster builds

## Success Criteria
- [ ] Docker images automatically built on release
- [ ] Multi-architecture support (amd64, arm64)
- [ ] Published to both Docker Hub and GHCR
- [ ] Proper version tagging
- [ ] Fast builds with caching
- [ ] Documentation updated with pull examples

## Related
Part of Phase 1: Foundation (Q1 2026)
Target: 1,000+ Docker pulls"

echo "✓ Created Issue #13: Docker Automation"

gh issue create --repo "$REPO" \
  --title "Add code coverage reporting and automated releases" \
  --label "infrastructure,phase-1,ci-cd,quality" \
  --body "## Overview
Implement code coverage tracking with reporting and automate the release process using semantic versioning and automated changelog generation.

## Part 1: Code Coverage Reporting

### Goals
- Track test coverage over time
- Prevent coverage regression
- Make coverage visible to contributors

### Implementation
- [ ] Integrate with Codecov or Coveralls
- [ ] Generate coverage reports in CI
- [ ] Add coverage badge to README
- [ ] Set coverage thresholds (target: >80%)
- [ ] Comment coverage on PRs
- [ ] Block PRs that significantly decrease coverage

## Part 2: Automated Releases

### Goals
- Streamline release process
- Automate changelog generation
- Follow semantic versioning
- Create GitHub releases automatically

### Implementation
- [ ] Use GoReleaser for Go-specific releases
- [ ] Build binaries for multiple platforms
- [ ] Create GitHub releases with artifacts
- [ ] Generate checksums and signatures
- [ ] Create CHANGELOG.md
- [ ] Trigger Docker image build

## Success Criteria
- [ ] Code coverage tracking enabled
- [ ] Coverage badge in README
- [ ] Automated releases on tag push
- [ ] Multi-platform binaries generated
- [ ] Changelog automatically generated
- [ ] GitHub releases created with artifacts

## Related
Part of Phase 1: Foundation (Q1 2026)
Reference: BUSINESS_STRATEGY_ROADMAP.md - Infrastructure"

echo "✓ Created Issue #14: Coverage & Releases"

# Developer Experience

gh issue create --repo "$REPO" \
  --title "Create Docker Compose examples for common scenarios" \
  --label "documentation,phase-1,developer-experience,docker" \
  --body "## Overview
Create Docker Compose configuration files for common deployment scenarios to make it easy for developers to get started with Multiprobe.

## Goals
- Lower the barrier to entry
- Provide ready-to-use examples
- Demonstrate best practices
- Show integration patterns

## Examples to Create

### 1. Basic Standalone (\`docker-compose.yml\`)
### 2. With Prometheus (\`examples/prometheus/docker-compose.yml\`)
### 3. Full Observability Stack (\`examples/observability/docker-compose.yml\`)
### 4. Load Testing Scenario (\`examples/load-testing/docker-compose.yml\`)
### 5. Development Setup (\`examples/development/docker-compose.yml\`)
### 6. Kubernetes Simulation (\`examples/kubernetes-local/docker-compose.yml\`)

## Success Criteria
- [ ] At least 4 complete examples created
- [ ] Each example has README with clear instructions
- [ ] Examples tested and verified working
- [ ] Referenced from main README
- [ ] Easy one-command startup (\`docker-compose up\`)

## Related
Part of Phase 1: Foundation (Q1 2026)
Target: Lowest time-to-value in category"

echo "✓ Created Issue #15: Docker Compose Examples"

gh issue create --repo "$REPO" \
  --title "Write comprehensive tests (unit + integration)" \
  --label "testing,phase-1,quality,priority-high" \
  --body "## Overview
Implement comprehensive test coverage for all Multiprobe functionality, including unit tests, integration tests, and end-to-end tests.

## Goals
- Ensure code quality and reliability
- Prevent regressions
- Enable confident refactoring
- Demonstrate best practices
- Achieve >80% code coverage

## Testing Strategy

### 1. Unit Tests
Test individual functions and components in isolation.

### 2. Integration Tests
Test interactions between components.

### 3. Performance Tests
Benchmark critical paths.

### 4. Docker Integration Tests
Test Docker image functionality.

## Test Coverage Requirements
- Overall coverage: >80%
- Critical paths coverage: >90%
- New code coverage: 100% (via CI checks)

## Success Criteria
- [ ] >80% code coverage achieved
- [ ] All endpoints have unit tests
- [ ] Integration tests cover main workflows
- [ ] Benchmarks for performance-critical code
- [ ] Tests pass consistently in CI
- [ ] Test documentation complete

## Related
Part of Phase 1: Foundation (Q1 2026)
Reference: BUSINESS_STRATEGY_ROADMAP.md - Core Features"

echo "✓ Created Issue #16: Comprehensive Tests"

# Content & Marketing

gh issue create --repo "$REPO" \
  --title "Create project social media presence (Twitter/X account)" \
  --label "marketing,phase-1,community" \
  --body "## Overview
Establish a social media presence for Multiprobe to share updates, engage with the community, and increase project visibility.

## Goals
- Build brand awareness
- Share project updates and releases
- Engage with developer community
- Drive traffic to repository and docs

## Platform: Twitter/X

### Account Setup
- [ ] Create @multiprobe_dev or @multiprobeio account
- [ ] Professional profile picture (logo)
- [ ] Banner image with tagline
- [ ] Bio with link to GitHub repo
- [ ] Pinned tweet with project introduction

## Success Criteria
- [ ] Account created and professionally set up
- [ ] Posting schedule established
- [ ] First 10 tweets published
- [ ] Linked from main repository
- [ ] At least 100 followers by end of Phase 1

## Related
Part of Phase 1: Foundation (Q1 2026)
Supports go-to-market strategy"

echo "✓ Created Issue #17: Social Media"

gh issue create --repo "$REPO" \
  --title "Write 3-5 tutorial blog posts/videos" \
  --label "documentation,phase-1,content,marketing" \
  --body "## Overview
Create high-quality tutorial content (blog posts or videos) to demonstrate Multiprobe use cases, attract users, and improve SEO.

## Goals
- Educate developers on Multiprobe use cases
- Improve search engine visibility
- Drive traffic to project
- Establish thought leadership
- Support Phase 1 success metric (3-5 tutorial blog posts)

## Content Topics (5 tutorials)

### Tutorial 1: \"Getting Started with Multiprobe: HTTP Testing Made Easy\"
### Tutorial 2: \"Testing Kubernetes Ingress Controllers with Multiprobe\"
### Tutorial 3: \"Load Testing and Chaos Engineering with Multiprobe\"
### Tutorial 4: \"Building a Complete Observability Stack\"
### Tutorial 5: \"HTTP Request Debugging: From Development to Production\"

## Success Criteria
- [ ] 3-5 tutorials published
- [ ] Published on project blog and dev.to minimum
- [ ] At least 1 video tutorial on YouTube
- [ ] Each tutorial includes working code examples
- [ ] Promoted via social media and community channels
- [ ] Track metrics: views, engagement, inbound links

## Related
Part of Phase 1: Foundation (Q1 2026)
Deliverable: \"3-5 tutorial blog posts/videos\"
Supports go-to-market strategy"

echo "✓ Created Issue #18: Tutorial Content"

echo ""
echo "========================================="
echo "✅ All 18 Phase 1 issues created!"
echo "========================================="
echo ""
echo "View them at: https://github.com/$REPO/issues"
