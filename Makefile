SHELL := /bin/bash

COMPOSE_FILE := infra/docker-compose.yml
COMPOSE := docker compose -f $(COMPOSE_FILE)

.PHONY: help up down restart build logs ps shell artisan composer migrate seed backend-install backend-env backend-key bootstrap frontend-install frontend-dev dev

help:
	@echo "Targets:"
	@echo "  bootstrap          First-time setup for backend (env + deps + up + key + migrate)"
	@echo "  up                 Start backend container"
	@echo "  down               Stop containers"
	@echo "  restart            Restart containers"
	@echo "  build              Build containers"
	@echo "  logs               Tail backend logs"
	@echo "  ps                 List containers"
	@echo "  shell              Shell into backend container"
	@echo "  artisan cmd=...     Run artisan command"
	@echo "  composer cmd=...    Run composer command"
	@echo "  migrate            Run database migrations"
	@echo "  seed               Run database seeders"
	@echo "  frontend-install   Install frontend dependencies"
	@echo "  frontend-dev       Start frontend dev server"
	@echo "  dev                Start backend + frontend"

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) down
	$(COMPOSE) up -d --build

build:
	$(COMPOSE) build

logs:
	$(COMPOSE) logs -f --tail=200

ps:
	$(COMPOSE) ps

shell:
	$(COMPOSE) exec backend sh

artisan:
	$(COMPOSE) exec backend php artisan $(cmd)

composer:
	$(COMPOSE) exec backend composer $(cmd)

backend-install:
	$(COMPOSE) run --rm backend composer install

backend-env:
	@if [ ! -f apps/backend/.env ]; then cp apps/backend/.env.example apps/backend/.env; fi

backend-key:
	$(COMPOSE) run --rm backend php artisan key:generate

migrate:
	$(COMPOSE) exec backend php artisan migrate

seed:
	$(COMPOSE) exec backend php artisan db:seed

bootstrap: backend-env backend-install up
	$(COMPOSE) exec backend php artisan key:generate
	$(COMPOSE) exec backend php artisan migrate

frontend-install:
	cd apps/frontend && npm install

frontend-dev:
	cd apps/frontend && npm run dev

dev: up
	$(MAKE) frontend-dev
