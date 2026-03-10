# Component Map (darkspace)

## Server-side components

- `DarkSpaceServer/`
  - Dedicated world/game server process.
  - Depends on Meta/Process/Mirror services from `gamecq`.
  - Config file: `DarkSpaceServer/config.ini`
- `DarkSpaceServerMFC/`
  - MFC admin/launcher wrapper for server operations.
  - Uses mirror/meta addresses and local server execution settings.
- `Build/`
  - Operational scripts for promotion/deploy automation.
  - Historically pointed at external infrastructure; now being localized.

## Web-related artifacts

- `Web.sln`
  - Legacy solution still points to external HTTP-hosted project path.
  - Kept documented here for future replacement with local web project source.

## Inputs from other repos

- `gamecq`:
  - MetaServer, ProcessServer, MirrorServer availability and config compatibility.
- `medusa`:
  - Shared libraries/protocol code consumed by server processes.
