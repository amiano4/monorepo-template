# Project Template

Reusable monorepo layout with Docker-first dev infra.

## Structure
```
project/
├── apps/
│   ├── backend/           # Laravel backend
│   └── frontend/          # Vue/Quasar frontend
├── infra/                 # Docker + compose (dev only)
├── docs/
│   └── technical/
├── AGENTS.md
├── README.md
└── Makefile
```

## Usage
- Update `infra/docker-compose.yml` container names, DB name, ports as needed.
- Install deps manually in `apps/backend` and `apps/frontend`.
- Use `make up` to start dev containers.

## Services (dev)
- Backend: https://localhost (HTTP on http://localhost redirects to HTTPS)
- PhpMyAdmin: http://localhost:8080
- MailHog UI: http://localhost:8025

## Notes
- Self-signed TLS certs are stored in `infra/docker/nginx/ssl-certificates`.
- Production deployment should not rely on `infra/`.
