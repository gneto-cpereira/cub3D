# 🕹️Cub3D

### 42 Lisboa group project.
Cub3D is a 1st-person raycasting engine inspired by the world-famous 90's game Wolfenstein 3D. Built in C using the MiniLibX library, it features dynamic rendering of a 3D environment based on 2D maps, complete with texture mapping, sprite rendering, and collision detection.

## 🚀 How to compile it
### Prerequisites
- Docker installed.
### Commands
```bash
git clone https://github.com/gneto-cpereira/cub3D.git
cd cub3D
./run.sh
```
A menu will open where you can select a map to view.

### Interactive Launcher
I developed a Bash Wrapper Script that handles the Docker build and provides an interactive menu to choose a map:

# 📽️ Videos

![v1](https://github.com/user-attachments/assets/4bf64060-476e-47b7-8635-54005bb0f5cd)

https://github.com/user-attachments/assets/ac3c7aea-f822-478b-acdf-3f0147146862

https://github.com/user-attachments/assets/6d682358-70c3-4984-ab92-2eb7834a864d

https://github.com/user-attachments/assets/fd99ffcd-2f96-4643-814c-a4928e0859aa


## 🛠️ Skills & Technical Knowledge
### 💻 C Programming & Resource Management
- **C Development:** Written in C following strict standards (-Wall -Wextra -Werror) for robust performance.
- **Memory Safety:** Manual management of the heap and stack. All structures, textures, and sprites are validated via Valgrind to ensure zero memory leaks.
- **Complex Data Structures:** Efficient use of structs and linked lists to manage game state, sprites, and raycast data.
- 
### 📐 Computer Graphics & Game Math
- **Raycasting Engine:** Implementation of the DDA (Digital Differential Analysis) algorithm to calculate wall distances and perspective.
- **Texture Mapping:** Logic to calculate the exact pixel of an XPM/PNG texture to render on a wall based on collision coordinates.
- **Trigonometry:** Extensive use of sine and cosine functions for player rotation, field of view (FOV) calculations, and movement vectors.
- **Collision Detection:** Implementation of a sliding collision system to allow smooth movement against walls.

### 🏗️ Build Systems & DevOps
- **Containerization:** Docker (Ubuntu 22.04) environment used to handle all graphical and audio dependencies (X 11, ALSA), ensuring portability across different Operating Systems.
- **Automation:** Advanced Bash scripting to abstract complex Docker CLI commands and manage game assets.
- **Makefiles:** Optimized build system with incremental compilation to handle multiple source subdirectories.

### 🧩 Data Parsing & Game Assets
- **Scene Description:** Developed a robust parser for .cub files, validating paths for textures, RGB colors for floor/ceiling, and map integrity (closed walls, player starting position).
- **Asset Management:** Integration of multiple textures, sprites (ducks/backpacks), and audio files (. Wav) into the game loop.
