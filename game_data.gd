class_name GameData
extends Object


const cosine = cos(PI / 2)  ## = 0
const sine = sin(PI / 2)  ## = 1
const rotation_matrix = [cosine, sine, -sine, cosine] ## Rotation constants for 90 degree clockwise rotation. Refer here for more information about the math https://www.cuemath.com/algebra/rotation-matrix/.


## To add new tetrominos add your tetromino name here then add an 
## entry to tetrominos below (see @/models/tetromino.gd for required parameters).
enum { square, tee, l_left, l_right, zag_right, zag_left, line }


const ghost_layer = 2
const ghost_block_tile_id = 7
const background_layer = 1
const background_tile_id = 8


## Tetrominos available to spawn in game.
var tetrominoes = {
    square: Tetromino.new(
        square, # Tile ID
        [Vector2(0, 0), Vector2(0, 1), Vector2(1, 0), Vector2(1, 1)], # Block grid coordinates
        Vector2(-0.5, -0.5) # Rotation center offset
    ),
    tee: Tetromino.new(
        tee,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, 0)]
    ),
    l_right: Tetromino.new(
        l_right,
        [Vector2(-1, -1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)]
    ),
    l_left: Tetromino.new(
        l_left,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(1, -1)]
    ),
    zag_right: Tetromino.new(
        zag_right,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, -1)]
    ),
    zag_left: Tetromino.new(
        zag_left,
        [Vector2(-1, -1), Vector2(0, -1), Vector2(0, 0), Vector2(1, 0)]
    ),
    line: Tetromino.new(
        line,
        [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0)],
        Vector2(-0.5, -0.5)
    )
}
