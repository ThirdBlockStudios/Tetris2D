class_name GameData
extends Object


const cosine = cos(PI / 2)  ## = 0
const sine = sin(PI / 2)  ## = 1
const rotation_matrix = [cosine, sine, -sine, cosine] ## Rotation constants for 90 degree clockwise rotation. Refer here for more information about the math https://www.cuemath.com/algebra/rotation-matrix/.


## To add new tetrominos add your tetromino name here then add an 
## entry to tetrominos below (see @/models/tetromino.gd for required parameters).
enum types { square, tee, l_left, l_right, zag_right, zag_left, line, ghost, background }


## Board tile map layers.
enum layers { game, background, ghost }


## Tetrominos available to spawn in game.
var tetrominoes = {
    types.square: Tetromino.new(
        types.square, # Tile ID
        [Vector2(0, 0), Vector2(0, 1), Vector2(1, 0), Vector2(1, 1)], # Block grid coordinates
        Vector2(-0.5, -0.5) # Rotation center offset
    ),
    types.tee: Tetromino.new(
        types.tee,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, 0)]
    ),
    types.l_right: Tetromino.new(
        types.l_right,
        [Vector2(-1, -1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)]
    ),
    types.l_left: Tetromino.new(
        types.l_left,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(1, -1)]
    ),
    types.zag_right: Tetromino.new(
        types.zag_right,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, -1)]
    ),
    types.zag_left: Tetromino.new(
        types.zag_left,
        [Vector2(-1, -1), Vector2(0, -1), Vector2(0, 0), Vector2(1, 0)]
    ),
    types.line: Tetromino.new(
        types.line,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0)],
        Vector2(-0.5, -0.5)
    )
}
