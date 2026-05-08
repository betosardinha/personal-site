COMPOSE=docker compose

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up

upd:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f

lint:
	$(COMPOSE) exec app pnpm lint

format:
	$(COMPOSE) exec app pnpm format

check:
	$(COMPOSE) exec app pnpm check

validate:
	$(COMPOSE) exec app pnpm format
	$(COMPOSE) exec app pnpm lint
	$(COMPOSE) exec app pnpm check
