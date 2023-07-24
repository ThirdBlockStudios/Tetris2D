class_name GameData
extends Object

const COSINE = cos(PI / 2)  ## = 0
const SINE = sin(PI / 2)  ## = 1
const ROTATION_MATRIX = [COSINE, SINE, -SINE, COSINE]  ## Rotation constants for 90 degree clockwise rotation. Refer here for more information about the math https://www.cuemath.com/algebra/rotation-matrix/.


## To add new tetrominos:
## 1. Add your tetromino name to Types enums after background. New sprites should also have IDs greater than that of background.
## 2. Using your new enum. Add a new entry to TETROMINOES below (see @/models/tetromino.gd for required parameters).
enum Types { SQUARE, TEE, L_LEFT, L_RIGHT, ZAG_RIGHT, ZAG_LEFT, LINE, DOUBLE_SQUARE, DEFAULT }


const GHOST = 7 ## Tile map id for ghost back sprite
const BACKGROUND = 8 ## Tile map id for background sprite


## Board tile map Layers.
enum Layers { GAME, BACKGROUND, GHOST }


## Tetrominoes available to spawn in game.
const TETROMINOES = {
    Types.SQUARE: {
        "type": Types.SQUARE,
        "tile_id": Types.SQUARE, # Tile ID
        "block_grid_coordinates": [Vector2(0, 0), Vector2(0, 1), Vector2(1, 0), Vector2(1, 1)], # Block grid coordinates
        "rotation_center_offset": Vector2(-0.5, -0.5)  # Rotation center offset
    },
    Types.TEE: {
        "type": Types.TEE,
        "tile_id": Types.TEE, # Tile ID
        "block_grid_coordinates": [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, 0)], # Block grid coordinates
        "rotation_center_offset": Vector2(-0.5, -0.5)  # Rotation center offset
    },
    Types.L_LEFT: {
        "type": Types.L_LEFT,
        "tile_id": Types.L_LEFT, # Tile ID
        "block_grid_coordinates": [Vector2(-1, -1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)], # Block grid coordinates
        "rotation_center_offset": Vector2(-0.5, -0.5)  # Rotation center offset
    },
    Types.L_RIGHT: {
        "type": Types.L_RIGHT,
        "tile_id": Types.L_RIGHT, # Tile ID
        "block_grid_coordinates": [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(1, -1)], # Block grid coordinates
        "rotation_center_offset": Vector2(-0.5, -0.5)  # Rotation center offset
    },
    Types.ZAG_LEFT: {
        "type": Types.ZAG_LEFT,
        "tile_id": Types.ZAG_LEFT, # Tile ID
        "block_grid_coordinates": [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, -1)], # Block grid coordinates
        "rotation_center_offset": Vector2(-0.5, -0.5)  # Rotation center offset
    },
    Types.ZAG_RIGHT: {
        "type": Types.ZAG_RIGHT,
        "tile_id": Types.ZAG_RIGHT, # Tile ID
        "block_grid_coordinates": [Vector2(-1, -1), Vector2(0, -1), Vector2(0, 0), Vector2(1, 0)], # Block grid coordinates
        "rotation_center_offset": Vector2(-0.5, -0.5)  # Rotation center offset
    },
    Types.LINE: {
        "type": Types.LINE,
        "tile_id": Types.LINE, # Tile ID
        "block_grid_coordinates": [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0)], # Block grid coordinates
        "rotation_center_offset": Vector2(-0.5, -0.5)  # Rotation center offset
    },
    Types.DOUBLE_SQUARE: {
        "type": Types.DOUBLE_SQUARE,
        "tile_id": Types.SQUARE, # Tile ID
        "block_grid_coordinates": [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0), Vector2(-1, -1), Vector2(0, -1), Vector2(1, -1), Vector2(2, -1)], # Block grid coordinates
        "rotation_center_offset": Vector2(-0.5, -0.5)  # Rotation center offset
    }
}
