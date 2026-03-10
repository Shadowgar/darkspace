# DarkSpace Revival (Server/Web Scope)

This folder is the source of truth for all server-side revival work inside the `darkspace` repo.

## Scope in this repo

- `DarkSpaceServer` runtime defaults and server configs
- `DarkSpaceServerMFC` launcher/admin server utilities
- Deployment/automation scripts under `Build`
- Legacy web solution pointer (`Web.sln`) and related server-side references

## Drift control rules

- Every code/config change must be appended to `DRIFT_LOG.md` in this folder.
- Server/web component ownership must be kept current in `COMPONENT_MAP.md`.
- Changes that impact cross-repo runtime contracts (ports, hostnames, credentials, startup order) must also be reflected in:
  - `gamecq/revival/DRIFT_LOG.md`
  - `medusa/revival/DRIFT_LOG.md`

## Current objective

Containerize server-side stack first. Client/runtime game UX work is out of scope until server stack is stable.

## Modernization track

- See `MODERNIZATION_PLAN.md` for server-side modernization sequencing while client modernization remains deferred.

Primary orchestration contract currently lives in:

- `gamecq/revival/docker-compose.server.yml`
