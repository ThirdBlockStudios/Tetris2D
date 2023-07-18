class_name Piece
extends Node2D

@export var block_scene: PackedScene

## Represents piece type.
var type: int
var data
var cells
var board: MainBoard
var blocks: Array[Vector2]
var step_delay = 1.0


## Holds block arrangements as JSON.
var block_type_data


func _ready():
    board = get_tree().get_first_node_in_group('board')


func _process(delta):
    board.Board_clearPiece(self)
    board.Board_setPiece(self, false)


func initialize(spawn_position: Vector2, piece_data):
    position = spawn_position
    data = piece_data
    cells = piece_data.cells
#    current_rotation_index = 3
    $Ticker.start(step_delay)
#    lock_time = 0.0


## Controls piece falling.
func _on_tick():
    self.position += Vector2(0, 1)
