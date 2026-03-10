# DarkSpace Revival

This folder is the source of truth for revival planning and runtime integration work inside the `darkspace` repo.

## Scope in this repo

- `DarkSpaceServer` runtime defaults and server configs
- `DarkSpaceServerMFC` launcher and admin server utilities
- `DarkSpaceClient`, gameplay code, UI, and content/runtime packaging
- Deployment and automation scripts under `Build`
- Legacy web solution pointer (`Web.sln`) and related server-side references

## Drift control rules

- Every code/config change must be appended to `DRIFT_LOG.md` in this folder.
- Server/web component ownership must be kept current in `COMPONENT_MAP.md`.
- Changes that impact cross-repo runtime contracts (ports, hostnames, credentials, startup order) must also be reflected in:
  - `gamecq/revival/DRIFT_LOG.md`
  - `medusa/revival/DRIFT_LOG.md`

## Planning docs

- `GRAND_PLAN.md`: cross-repo strategy that ties `darkspace`, `gamecq`, and `medusa` together
- `REVIVAL_PLAN.md`: repo-specific audit and execution plan for gameplay, client, server, and content
- `MODERNIZATION_PLAN.md`: earlier tactical modernization notes retained for continuity

Primary orchestration contract currently lives in:

- `gamecq/revival/docker-compose.server.yml`
