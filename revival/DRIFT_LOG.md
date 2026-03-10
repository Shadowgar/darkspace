# Drift Log (darkspace)

## 2026-03-10

- Initialized `darkspace/revival/` documentation baseline:
  - `README.md`
  - `COMPONENT_MAP.md`
  - `MODERNIZATION_PLAN.md`
  - `DRIFT_LOG.md` (this file)
- Localized server defaults to local orchestration targets:
  - `DarkSpaceServer/config.ini`
  - `DarkSpaceServer/DarkSpaceServer.cpp`
  - `DarkSpaceServerMFC/ServerDlg.cpp`
  - `DarkSpaceServerMFC/DarkSpaceServerMFC.ini`
  - `LocalServer/LocalServer.cpp`
  - `Tools/UniverseContextPort/PortView.cpp`
- Removed committed credentials from server config paths:
  - `DarkSpaceServer/config.ini`
  - `Build/sendmail.ini` placeholderized password field
  - `Build/BuildInstaller.bat` removed inline SVN password
- Repointed legacy deployment scripts to local/default addresses:
  - `Build/PromoteAlphaBeta.bat`
  - `Build/PromoteBetaRelease.bat`
- Replaced hardcoded historical remote build login string in project metadata with placeholder value:
  - `builder@example.invalid:22` now used instead of prior credential-like host string.
- Cross-repo container contract update:
  - `gamecq/revival/scripts/stage-server-config.ps1` now stages `DarkSpaceServer/config.ini` to `gamecq/revival/runtime/config/config.ini` and rewrites network/path defaults for container runtime:
    - `metaAddress=metaserver`
    - bind address and data/log/storage paths aligned to compose-mounted runtime directories.
- Cross-repo Linux build/staging update:
  - `gamecq/revival/scripts/build-linux-server-bootstrap.ps1` + builder container now compile `libDarkSpace.so` and `DarkSpaceServer` into `darkspace/out/server-bootstrap/Release`.
  - `gamecq/revival/scripts/stage-server-binaries.ps1` stages these artifacts into `gamecq/revival/runtime/bin`.
- Cross-repo runtime data staging update:
  - `gamecq/revival/scripts/stage-darkspace-data.ps1` now stages `darkspace/Ports/*` into `gamecq/revival/runtime/data` for DarkSpace server context/resource loading.
