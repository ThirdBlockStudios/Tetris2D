class_name Piece
extends Node2D

@export var block_scene: PackedScene

var main: MainScript
var board: MainBoard

## Represents piece type.
var data
var tile_id: int
var center_offset
var blocks  #Array[Vector2] # hold grid position of child blocks

var step_delay = 0.5
var lock_delay = 0.5
var lock_time = 0
var input_delay = 0.1  # controls consecutive left/right/down movement lag on hold


func _ready():
    main = get_tree().get_first_node_in_group("main")
    board = get_tree().get_first_node_in_group("board")


func initialize(spawn_position: Vector2, piece_data):
    position = spawn_position
    data = piece_data
    tile_id = piece_data.tile_id
    blocks = piece_data.blocks
    center_offset = piece_data.center_offset
#    current_rotation_index = 3
    $Ticker.start(step_delay)
    lock_time = 0.0


func _process(delta):
    lock_time += delta
    input_delay += delta
    board.Board_clearPiece(self)
    if input_delay > 0.15:
        if Input.is_action_pressed("ui_right"):
            input_delay = 0
            move(Vector2.RIGHT)
        if Input.is_action_pressed("ui_left"):
            input_delay = 0
            move(Vector2.LEFT)
        if Input.is_action_pressed("ui_down"):
            input_delay = 0
            move(Vector2.DOWN)
    if Input.is_action_just_pressed("ui_up"):
        rotate_piece()
    if Input.is_action_just_pressed("hard_drop"):
        hard_drop()
#    if Input.is_action_just_pressed("hold_piece"):
#        hold_piece()
    board.Board_drawGhost(self)
    board.Board_setPiece(self, false)


## Returns validity of move to stop hard drop
func move(translation: Vector2) -> bool:
    var new_position = self.position + translation
    if board.Board_isMoveValid(self, new_position):
        position = new_position
        lock_time = 0
        return true
    return false


## Rotates piece 90 degrees (pi/2 radians) using a rotation matrix. With a 90 degrees counterclockwise rotation
## this simplifies down to new_x = -old_y; new_y = old_x.
func rotate_piece():
    var new_blocks = []
    var x: int
    var y: int    
    for current_block in blocks:
        x = ceili(-1 *(current_block.y + center_offset.y))
        y = ceili(current_block.x + center_offset.x)
        new_blocks.push_back(Vector2(roundi(x), roundi(y)))
    var old_blocks = blocks
    blocks = new_blocks
    if board.Board_isMoveValid(self, self.position):
        return
    else:
        blocks = old_blocks
        

func hard_drop():
    while move(Vector2.DOWN):
        continue
    lock()


func lock():
    board.Board_setPiece(self, true)
    board.Board_playTiles()
    main.spawn_piece()


#    can_reserve = true


## Controls piece falling.
func _on_tick():
    board.Board_clearPiece(self)
    move(Vector2.DOWN)
    if lock_time > lock_delay:
        lock()
