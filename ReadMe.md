# which tech stack is used in this code base

GitHub Copilot: Based on the codebase analysis, here's the key technology stack used:

### Backend Framework & Runtime
- **Node.js** as the runtime environment
- **Express.js** as the web framework

### Database
- **PostgreSQL** as the primary database
- **Drizzle ORM** for database interactions and migrations

### Testing
- **Jest** as the testing framework
- **Supertest** for HTTP assertions in API testing

### API & Data Format
- **FHIR** (Fast Healthcare Interoperability Resources) for healthcare data standards
- **JSON** for data interchange

### Development & Build Tools
- **npm** for package management
- **nodemon** for development server auto-reload
- **prettier** for code formatting
- **morgan** for HTTP request logging
- **winston** for application logging

### Deployment & Container Tools
- **Docker** for containerization
- **Docker Compose** for local development environment
- **Fly.io** for deployment (based on fly.toml configuration)

### CI/CD
- **GitHub Actions** for:
  - Continuous Integration testing
  - Automated deployments to Fly.io

### Security & Configuration
- **dotenv** for environment configuration
- **CORS** middleware for Cross-Origin Resource Sharing
- **AJV** for JSON Schema validation

This appears to be a healthcare-focused application implementing a Security Labeling Service (SLS) following FHIR standards, with a modern Node.js backend stack and robust DevOps practices.