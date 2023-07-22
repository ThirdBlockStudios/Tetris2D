class_name GameData
extends Node

enum Tetromino {
    SQUARE,
    TEE,
    L_LEFT,
    L_RIGHT,
    ZAG_RIGHT,
    ZAG_LEFT,
    LINE,
    DOUBLE_SQUARE,
}

const COSINE = cos(PI / 2)  ## = 0
const SINE = sin(PI / 2)  ## = 1
const ROTATION_MATRIX = [COSINE, SINE, -SINE, COSINE]

const TILE_ID = {
    Tetromino.SQUARE: 0,
    Tetromino.TEE: 1,
    Tetromino.L_LEFT: 2,
    Tetromino.L_RIGHT: 3,
    Tetromino.ZAG_RIGHT: 4,
    Tetromino.ZAG_LEFT: 5,
    Tetromino.LINE: 6,
    Tetromino.DOUBLE_SQUARE: 0,
}

const BLOCKS = {
    Tetromino.SQUARE: [Vector2(0, 0), Vector2(1, 0), Vector2(0, 1), Vector2(1, 1)],
    Tetromino.TEE: [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, 0)],
    Tetromino.L_LEFT: [Vector2(-1, -1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)],
    Tetromino.L_RIGHT: [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(1, -1)],
    Tetromino.ZAG_RIGHT: [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, -1)],
    Tetromino.ZAG_LEFT: [Vector2(-1, -1), Vector2(0, -1), Vector2(0, 0), Vector2(1, 0)],
    Tetromino.LINE: [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0)],
    Tetromino.DOUBLE_SQUARE:
    [
        Vector2(-1, 0),
        Vector2(0, 0),
        Vector2(1, 0),
        Vector2(2, 0),
        Vector2(-1, 1),
        Vector2(0, 1),
        Vector2(1, 1),
        Vector2(2, 1)
    ],
}

const CENTER_OFFSET = {
    Tetromino.SQUARE: Vector2(-0.5, -0.5),
    Tetromino.TEE: Vector2(0, 0),
    Tetromino.L_LEFT: Vector2(0, 0),
    Tetromino.L_RIGHT: Vector2(0, 0),
    Tetromino.ZAG_RIGHT: Vector2(0, 0),
    Tetromino.ZAG_LEFT: Vector2(0, 0),
    Tetromino.LINE: Vector2(-0.5, -0.5),
    Tetromino.DOUBLE_SQUARE: Vector2(-0.5, -0.5),
}
