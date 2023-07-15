## This class contains the majority of game logic.
class_name MainScript
extends Node

@onready var piece_scene = load("res://piece.tscn")

var initial_piece

## Called when the node enters the scene tree for the first time.
func _ready():
    randomize() ## randomize rng seed
    initial_piece = piece_scene.instantiate()
    initial_piece.setType(randi() % 7) ## randomize piece type
    initial_piece.position = Vector2(144, 0) ## place block at "center" top
    add_child(initial_piece)
    pass  # Replace with function body.

## Called when an InputEventKey hasn't been consumed by _input or any GUI Control item (i.e., gameplay input).
func _unhandled_key_input(event: InputEvent):
    if event.is_action_pressed("spawn_piece_testing"):
        spawn_new()
    pass

## Test function for spawning a new piece
func spawn_new():
    initial_piece.queue_free()
    _ready()

## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


## This is the game's main loop called every game tick. It is primarily responsible for updating the active piece's position (falling).
## The tick rate or speed of the game is determined by the current wait time of TickTimer.
func _on_tick():
    # TODO: speed up game -> decrease TickTimer wait time by percentage based on either points or
    pass  # Replace with function body.
