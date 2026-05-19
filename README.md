# infhub v1.3
### Made by justnormalskin

A modular Roblox script hub with Movement, Visual, Character, and Protection features.  
Supports **PC + Mobile + Tablet**.

## Quick Start
Paste this into your executor:
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/garbielsarjveladze-prog/infhub/main/loader.lua"))()
```

## Features

### 🏃 Movement
- Fly (adjustable speed)
- Walk Speed boost
- High Jump
- Teleport to player
- Noclip
- Dash (keybind)
- Low Gravity
- Wall Climb

### ✨ Visual
- Rainbow Trail
- Sparkle Particles
- Fullbright
- Rainbow Body Color
- Screen Shake
- Rainbow Aura
- Glow Outline

### 🧍 Character
- God Mode
- Invisibility
- Freeze
- Ragdoll
- Size Change (1x-10x)
- Reset Character
- Reset All Settings

### 🛡️ Protection
- Anti-Fling
- Anti-Kick
- Anti-Teleport
- Anti-AFK Kick
- Anti-Slowdown
- Humanoid Spoof

### 📱 Mobile
- Touch fly buttons (Up/Down)
- Dash button
- Noclip toggle
- Fly toggle
- Auto-hides on PC

## File Structure
```
infhub/
├── loader.lua       ← Main loader (execute this)
├── core.lua         ← Shared services, state, helpers
├── movement.lua     ← Movement features
├── visual.lua       ← Visual effects
├── character.lua    ← Character modifications
├── protection.lua   ← Anti-cheat features
├── mobile.lua       ← Mobile/tablet touch UI
└── README.md
```

## UI Library
Uses [Vanis UI LIB](https://github.com/cypherdh/VanisUILIB)

## Setup
1. Create a new GitHub repository named `infhub`
2. Upload all `.lua` files to the repo
3. Make sure the repo is **Public**
4. The `loader.lua` is already configured with your GitHub username
5. Execute the loadstring in your executor
