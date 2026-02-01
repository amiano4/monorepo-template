# AGENTS.md - Template

## Purpose
This is a baseline structure for new projects. Customize sections as needed per project.

## Project Overview
- Backend: Laravel
- Frontend: Vue/Quasar
- Infra: Docker (dev only)

## Repo Layout
```
project/
├── apps/
│   ├── backend/
│   └── frontend/
├── infra/
├── docs/
└── AGENTS.md
```

## Development Notes
- Install dependencies manually via shell.
- Use `make up` for dev containers.
- Update compose service names and env values per project.
