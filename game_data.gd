class_name GameData
extends Object

const cosine = cos(PI / 2)  ## = 0
const sine = sin(PI / 2)  ## = 1
const rotation_matrix = [cosine, sine, -sine, cosine]  ## Rotation constants for 90 degree clockwise rotation. Refer here for more information about the math https://www.cuemath.com/algebra/rotation-matrix/.

## To add new tetrominos:
## 1. Add your tetromino name to Types enums after background. New sprites should also have IDs greater than that of background.
## 2. Using your new enum. Add a new entry to tetrominoes below (see @/models/tetromino.gd for required parameters).
enum Types { SQUARE, TEE, L_LEFT, L_RIGHT, ZAG_RIGHT, ZAG_LEFT, LINE, GHOST, BACKGROUND }

## Board tile map Layers.
enum Layers { GAME, BACKGROUND, GHOST }

## Tetrominoes available to spawn in game.
var tetrominoes = {
    Types.SQUARE:
    Tetromino.new(
        Types.SQUARE,  # Tile ID
        [Vector2(0, 0), Vector2(0, 1), Vector2(1, 0), Vector2(1, 1)],  # Block grid coordinates
        Vector2(-0.5, -0.5)  # Rotation center offset
    ),
    Types.TEE:
    Tetromino.new(Types.TEE, [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, 0)]),
    Types.L_RIGHT:
    Tetromino.new(Types.L_RIGHT, [Vector2(-1, -1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)]),
    Types.L_LEFT:
    Tetromino.new(Types.L_LEFT, [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(1, -1)]),
    Types.ZAG_RIGHT:
    Tetromino.new(Types.ZAG_RIGHT, [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, -1)]),
    Types.ZAG_LEFT:
    Tetromino.new(Types.ZAG_LEFT, [Vector2(-1, -1), Vector2(0, -1), Vector2(0, 0), Vector2(1, 0)]),
    Types.LINE:
    Tetromino.new(
        Types.LINE,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0)],
        Vector2(-0.5, -0.5)
    )
}
