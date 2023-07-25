class_name Piece
extends Node2D

@export var block_scene: PackedScene

var main: MainScript
var board: MainBoard
var pieceHolder: PieceHolder
var pieceHolderBoard: PieceHolderBoard

## Represents piece type.
var data
var type
var tile_id: int
var center_offset
var blocks  #Array[Vector2] # hold grid position of child blocks

# TODO(nkuang): const
var step_delay = 0.5  ## Fall//tick speed in seconds.
const lock_delay = 0.5  ## Grace time for lock in seconds.
var lock_time = 0  ## Helper variable for lock_delay.

## Determines if the current piece is holdable.
var isHoldable = true

@export_range(0, 10, 0.01, "suffix:s") var standard_movement_speed = 0.2  ## Input movement speed (left or right) in tick seconds between moves.
@export_range(0, 10, 0.01, "suffix:s") var hold_movement_speed = 0.07  ## Hold input movement speed (left or right) after lag delay in tick seconds between moves.
@export_range(0, 10, 0.01, "suffix:s") var lag_delay = 0.45  ## Delay before left right speed accelerates.
var current_input_delay = 0
var current_key_held_time = 0  ## Tracks current held time


func _ready():
    main = get_tree().get_first_node_in_group("main")
    board = get_tree().get_first_node_in_group("board")
    pieceHolderBoard = get_tree().get_first_node_in_group("piece_holder_board")
    pieceHolder = preload("res://piece_holder.gd").new()


func initialize(spawn_position: Vector2, piece_data: Dictionary):
    position = spawn_position
    data = piece_data
    type = piece_data.type
    tile_id = piece_data.tile_id
    blocks = piece_data.block_grid_coordinates
    center_offset = piece_data.rotation_center_offset
#    current_rotation_index = 3
    $Ticker.start(step_delay)
    lock_time = 0.0

var spam_threshold = 0.01
var spam_counter = 0

func _process(delta):
    lock_time += delta
    current_input_delay += delta
    board.Board_clearPiece(self)
    if (
        current_key_held_time == 0
        || current_input_delay > standard_movement_speed
        || (current_key_held_time > lag_delay && current_input_delay > hold_movement_speed) # Piece acceleration applies after a delay (current_key_held_time). This is reset below on key release.
    ):
        if Input.is_action_pressed("ui_right"):
            current_input_delay = 0
            if move(Vector2.RIGHT):
                $TickSound.play()
        if Input.is_action_pressed("ui_left"):
            current_input_delay = 0
            if move(Vector2.LEFT):
                $TickSound.play()
        if Input.is_action_pressed("ui_down"):
            current_input_delay = 0
            if move(Vector2.DOWN):
                $TickSound.play()
    if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_down"):
        current_key_held_time += delta
    if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"): # Resets key held time to delay acceleration on next input.
        current_key_held_time = 0
    if Input.is_action_just_pressed("ui_up"):
        rotate_piece()
    if Input.is_action_just_pressed("hard_drop"):
        hard_drop()
        $HardDropSound.play()
    if Input.is_action_just_pressed("hold_piece"):
        if isHoldable:
            hold_piece()
            return

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
    var x: float
    var y: float
    for current_block in blocks:
        x = -(current_block.y + center_offset.y)
        y = current_block.x + center_offset.x
        x -= center_offset.y
        y -= center_offset.x
        new_blocks.push_back(Vector2(x, y))
    var old_blocks = blocks
    blocks = new_blocks
    if board.Board_isMoveValid(self, self.position):
        $TickSound.play()
        return
    else:
        blocks = old_blocks


func hard_drop():
    while move(Vector2.DOWN):
        continue
    lock()


func hold_piece():
    board.Board_clearPiece(self)
    # Retrieve a held piece if it exists.
    var held_piece = pieceHolder.PieceHolder_getPiece()
    if held_piece < GameData.Types.DEFAULT:
        # Need to add it to the next queue.
        main.next_queue_push_front(held_piece)
    # Hold the piece.
    # TODO(nkuang): consolidate pieceHolder and pieceHolderBoard.
    pieceHolder.PieceHolder_holdPiece(self.type)
    pieceHolderBoard.PieceHolderBoard_render(self.type)
    main.spawn_piece()
    # Holding is disabled for the next piece.
    isHoldable = false


func lock():
    board.Board_setPiece(self, true)
    board.Board_playTiles()
    main.spawn_piece()

#    can_reserve = true
    # Once a piece is locked, piece storage cooldown refreshes.
    isHoldable = true


## Controls piece falling.
func _on_tick():
    board.Board_clearPiece(self)
    move(Vector2.DOWN)
    if lock_time > lock_delay:
        lock()
