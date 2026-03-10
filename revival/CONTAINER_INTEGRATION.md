# Container Integration Notes (darkspace)

## Role in stack

`darkspace` contributes `DarkSpaceServer` process and configuration to the server container stack orchestrated from `gamecq/revival/docker-compose.server.yml`.

## Files to mirror into `gamecq/revival/runtime/`

- Binary output:
  - `DarkSpaceServer` (Linux build target name expected)
- Config:
  - `DarkSpaceServer/config.ini` -> `runtime/config/config.ini`

## Contract assumptions

- Meta server target must resolve using container service DNS (`metaserver`), not loopback.
- No static production credentials in committed config.

Current staging path:

- `gamecq/revival/scripts/stage-server-config.ps1` rewrites `DarkSpaceServer/config.ini` into `gamecq/revival/runtime/config/config.ini` for container paths and service-host defaults.
- `gamecq/revival/scripts/stage-darkspace-data.ps1` copies `darkspace/Ports/*` into `gamecq/revival/runtime/data` for world/context resources.
- `gamecq/revival/scripts/build-linux-server-bootstrap.ps1` builds `libDarkSpace.so` and `DarkSpaceServer` via legacy Linux makefiles into `darkspace/out/server-bootstrap/Release`.
- `gamecq/revival/scripts/stage-server-binaries.ps1` stages `libDarkSpace.so` and `DarkSpaceServer` into `gamecq/revival/runtime/bin`.

## Drift policy

Any edit to DarkSpaceServer startup args, config keys, or default ports must be appended to `DRIFT_LOG.md` and cross-logged in `gamecq/revival/DRIFT_LOG.md`.
