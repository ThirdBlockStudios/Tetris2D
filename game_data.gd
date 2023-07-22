class_name GameData
extends Node

enum TETROMINO { square, tee, l_left, l_right, zag_right, zag_left, line , double_square }

const cosine = cos(PI / 2)  ## = 0
const sine = sin(PI / 2)  ## = 1
const rotation_matrix = [cosine, sine, -sine, cosine]

const tile_ids = {
    TETROMINO.square: 0,
    TETROMINO.tee: 1,
    TETROMINO.l_left: 2,
    TETROMINO.l_right: 3,
    TETROMINO.zag_right: 4,
    TETROMINO.zag_left: 5,
    TETROMINO.line: 6, 
    TETROMINO.double_square: 0
}

const blocks = {
    TETROMINO.square: [Vector2(0, 0), Vector2(1, 0), Vector2(0, 1), Vector2(1, 1)],
    TETROMINO.tee: [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, 0)],
    TETROMINO.l_left: [Vector2(-1, -1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)],
    TETROMINO.l_right: [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(1, -1)],
    TETROMINO.zag_right: [Vector2(-1, 0), Vector2(0, 0), Vector2(0, -1), Vector2(1, -1)],
    TETROMINO.zag_left: [Vector2(-1, -1), Vector2(0, -1), Vector2(0, 0), Vector2(1, 0)],
    TETROMINO.line: [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0)],
    TETROMINO.double_square: [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0), Vector2(-1, 1), Vector2(0, 1), Vector2(1, 1), Vector2(2, 1)]
}

const center_offset = {
    TETROMINO.square: Vector2(-0.5, -0.5),
    TETROMINO.tee: Vector2(0, 0),
    TETROMINO.l_left: Vector2(0, 0),
    TETROMINO.l_right: Vector2(0, 0),
    TETROMINO.zag_right: Vector2(0, 0),
    TETROMINO.zag_left: Vector2(0, 0),
    TETROMINO.line: Vector2(-0.5, -0.5),
    TETROMINO.double_square: Vector2(-0.5, -0.5)
}
