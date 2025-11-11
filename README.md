# ⌨️ Hyprland Keyboard Shortcuts

| **Category**                | **Keybinding**                      | **Action**                                     |
| --------------------------- | ----------------------------------- | ---------------------------------------------- |
| 🧠 **Core Controls**        | `SUPER + Return`                    | Open terminal (`kitty -e fish`)                |
|                             | `SUPER + C`                         | Close active window                            |
|                             | `SUPER + M`                         | Exit Hyprland                                  |
|                             | `SUPER + E`                         | Open file manager (`nautilus`)                 |
|                             | `SUPER + V`                         | Toggle floating mode                           |
|                             | `SUPER + R`                         | Open app launcher (`wofi`)                     |
|                             | `SUPER + P`                         | Toggle pseudotile mode                         |
|                             | `SUPER + J`                         | Toggle split layout                            |
|                             | `SUPER + W`                         | Launch Firefox                                 |
|                             | `SUPER + SHIFT + W`                 | Restart hyprpaper                              |
|                             | `SUPER + F`                         | Toggle fullscreen                              |
| 🧊 **Display Power**        | `SUPER + D`                         | Turn off monitor (`hyprctl dispatch dpms off`) |
|                             | `SUPER + SHIFT + D`                 | Turn on monitor (`hyprctl dispatch dpms on`)   |
| 🔒 **Lock & Sleep**         | `SUPER + L`                         | Lock screen (`swaylock -f`)                    |
|                             | `SUPER + CTRL + L`                  | Sleep (no lock)                                |
|                             | `SUPER + SHIFT + L`                 | Lock then sleep                                |
| 🪟 **Window Focus**         | `SUPER + ←`                         | Focus left window                              |
|                             | `SUPER + →`                         | Focus right window                             |
|                             | `SUPER + ↑`                         | Focus up window                                |
|                             | `SUPER + ↓`                         | Focus down window                              |
| 🖥 **Workspace Navigation** | `SUPER + [1–9,0]`                   | Switch to workspace 1–10                       |
|                             | `SUPER + SHIFT + [1–9,0]`           | Move window to workspace 1–10                  |
|                             | `SUPER + S`                         | Toggle special workspace ("magic")             |
|                             | `SUPER + SHIFT + S`                 | Move window to special workspace               |
|                             | `SUPER + Scroll Down` / `Page Down` | Next workspace                                 |
|                             | `SUPER + Scroll Up` / `Page Up`     | Previous workspace                             |
| 🖱 **Mouse Actions**        | `SUPER + LMB Drag`                  | Move window                                    |
|                             | `SUPER + RMB Drag`                  | Resize window                                  |
| 🔊 **Audio Controls**       | `XF86AudioRaiseVolume`              | Volume up 5%                                   |
|                             | `XF86AudioLowerVolume`              | Volume down 5%                                 |
|                             | `XF86AudioMute`                     | Toggle mute                                    |
|                             | `XF86AudioMicMute`                  | Toggle mic mute                                |
| 🎵 **Media Controls**       | `XF86AudioNext`                     | Next track                                     |
|                             | `XF86AudioPrev`                     | Previous track                                 |
|                             | `XF86AudioPlay / Pause`             | Play/Pause media                               |
| ☀️ **Brightness**           | `XF86MonBrightnessUp`               | Increase brightness 5%                         |
|                             | `XF86MonBrightnessDown`             | Decrease brightness 5%                         |

---

### 🪄 Notes

- `$mainMod` = **SUPER (Windows key)**
- Workspaces **1–6** are on your **main monitor (DP-1)**
- Workspaces **7–9** are on your **secondary monitor (DP-2)**
- The “special workspace” (`magic`) acts as a scratchpad — great for notes, terminals, or transient apps.
