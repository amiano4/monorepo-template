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

## Notes
- Production deployment should not rely on `infra/`.
