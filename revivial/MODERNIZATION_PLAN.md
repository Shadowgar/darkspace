# DarkSpace Server-Side Modernization Plan

This plan covers modernization work in `darkspace` that affects server runtime now, while deferring client modernization.

## Objectives

- Keep `DarkSpaceServer` compatible with containerized backend services.
- Remove fragile legacy config/deployment assumptions.
- Prepare server code for modern toolchain and shared engine upgrades.

## Phase 1: Server Runtime Hygiene

- Keep server defaults local/container-friendly.
- Remove committed secrets and dead infrastructure assumptions.
- Normalize startup config schema and document required keys.

## Phase 2: Build and Packaging Alignment

- Produce container-consumable server binary outputs.
- Align with `gamecq/revivial/runtime/` artifact contract.
- Add reproducible build docs and CI checks.

## Phase 3: Engine Interface Adaptation

- Track `medusa` abstraction changes and update server integration points.
- Keep protocol compatibility stable while engine internals evolve.
- Add integration tests for login/startup/world loop.

## Deferred Scope

- Full game client modernization is explicitly deferred until server stack and engine core are stable.
