# DarkSpace Revival Plan

This plan is aligned to `GRAND_PLAN.md` and assumes a server-first working-copy strategy.

## Repo Role

`darkspace` owns:

- dedicated server startup and world load
- gameplay rules and nouns
- client shell and UI
- content and legacy authoring assets

Current priority in this repo is not the client. It is the dedicated server path and the gameplay/runtime code that blocks it.

## Current Assessment

- The repo is still monolithic: client, server, tools, content, and installer-era code live together.
- Dedicated server code still inherits assumptions from the old engine stack.
- Gameplay and content are spread across C++, resources, Lua, and tool outputs.
- Client modernization is necessary, but it should not lead the project while the headless runtime is still unstable.

## New Execution Order

### Pass 1: Dedicated Server Stabilization

Review and modernize the dedicated server path line by line:

- `DarkSpaceServer/`
- server startup glue in shared gameplay code
- world load and registration code
- server-only config and data assumptions

Primary goals:

- remove unsafe runtime assumptions inherited from `medusa`
- make `DarkSpaceServer` start on the repaired substrate
- keep smoke tests short

### Pass 2: Gameplay Runtime Hygiene

Review high-risk gameplay code for:

- width-unsafe casts
- pointer truncation
- stack-heavy formatting and temporary buffers
- thread and timer assumptions
- serialization assumptions that depend on 32-bit layouts

This pass is about correctness first, not new features.

### Pass 3: Content Separation

Once the server path is stable:

- separate server-only runtime data from client-only assets and tools
- document which gameplay systems are still hardcoded
- identify content that can move into validated schemas later

### Pass 4: Client Modernization

Only after the server copy is stable:

- define the client/runtime seam
- remove single-core and D3D9-era assumptions
- modernize launcher, setup, and renderer path

## Working Rules For This Repo

- do not use long-running server experiments as the primary debugging loop
- favor static code sweeps and compile gates before runtime checks
- when a subsystem is touched, review it for 64-bit correctness, lifetime safety, and stack usage
- keep dedicated server work separate from client/UI cleanup unless the dependency is unavoidable

## Immediate Backlog

- inventory the dedicated server startup path and all `darkspace` code it touches
- map gameplay structures that depend on fixed 32-bit binary layouts
- identify server-only code that still drags in client-era assumptions
- define the minimum working dedicated-server smoke test
- defer client-only modernization until the server copy is up

## Success Signal

`darkspace` is successful for the current phase when `DarkSpaceServer` runs reliably on the repaired shared runtime and the path to later client modernization is cleaner than it is now.
