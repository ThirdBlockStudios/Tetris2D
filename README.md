# Tetris Project

This project is a simple 2D Tetris game developed using the Godot game engine and implemented in GDScript. It includes various features such as a visible piece queue, music and sound effects, piece holding, and all the standard Tetris gameplay elements. This README.md file provides instructions on how to run and customize the project.

![Tetris Demo](demo.gif)

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Gameplay Overview](#gameplay-overview)
- [Project Structure](#project-structure)
- [Running the Game](#running-the-game)
- [Customization](#customization)
  - [Changing Graphics and Audio](#changing-graphics-and-audio)
  - [Modifying Gameplay Mechanics](#modifying-gameplay-mechanics)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Prerequisites

To run this project, you need to have the following software installed:

- [Godot game engine](https://godotengine.org/) (version 3.3 or later)

### Installation

1. Clone or download this repository to your local machine.
2. Open Godot game engine.
3. Click on "Import" in the Godot project manager and select the root folder of the cloned/downloaded repository.
4. Once imported, select the project and click on "Edit" to open the project in the Godot editor.

## Gameplay Overview

In Tetris, the goal is to stack falling Tetriminos (tetromino shapes) in a way that forms complete horizontal lines. When a line is completed, it clears from the grid, and the player earns points. The game ends if the Tetriminos reach the top of the grid.

This project includes the following gameplay elements:

- **Visible Piece Queue**: The next pieces to fall are displayed in a queue, allowing the player to plan their moves in advance.
- **Music and Sound Effects**: The game features background music and sound effects for actions such as piece movement, line clears, and game over.
- **Piece Holding**: The player can temporarily store a current piece in a "hold" area and retrieve it later to strategize their gameplay.
- **Standard Tetris Features**: The game implements all the essential Tetris mechanics, including piece rotation, horizontal movement, soft and hard drops, and line clearing.

## Project Structure

The project structure is organized as follows:

- `addons/` - Contains any additional Godot addons (if used)
- `audio/` - Stores audio files for sound effects and music
- `res/` - Contains resource files such as fonts and textures
- `scenes/` - Contains the game scenes
  - `main/` - The main game scene and scripts
- `ui/` - User interface scripts and scenes
- `utils/` - Utility scripts
- `README.md` - Project README file
- `project.godot` - Godot project file

## Running the Game

To run the game, follow these steps:

1. Open the project in the Godot editor.
2. In the toolbar at the top, click on the "Play" button or press the F5 key.
3. The game will start in a new window or in the editor's game view.

## Customization

### Changing Graphics and Audio

- **Graphics**: You can modify the graphics by replacing the image files located in the `res/` folder. Ensure that the dimensions and formats of the new images are compatible with Godot's requirements.
- **Audio**: Sound effects and music files can be replaced by placing new audio files in the `audio/` folder. Make sure the file formats are supported by Godot.

### Modifying Gameplay Mechanics

The gameplay mechanics can be customized by modifying the scripts located in the `scenes/main/` folder. Here are some key scripts:

- `game.tscn` and `game.gd`: These files define the main game scene and control the game's logic. You can adjust parameters such as the game speed, score calculations, and piece spawn behavior here.
- `grid.tscn` and `grid.gd`: The grid scene handles the Tetris game grid and operations related to it. If you want to change the grid size or implement additional grid-related features, this is where you can make those changes.
- `piece.tscn` and `piece.gd`: The piece scene defines the Tetrimino shapes and handles their movement and rotation. You can modify the piece behavior, such as rotation rules or starting positions, within this script.

Feel free to explore other scripts and scenes to customize various aspects of the game to your liking.

## Contributing

Contributions to this project are welcome! If you have any bug fixes, improvements, or new features to add, please submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE), which means you are free to use, modify, and distribute the code. Please refer to the license file for more information.
