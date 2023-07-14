## This class contains the majority of game logic.
class_name MainScript
extends Node

@onready var piece_scene = load("res://piece.tscn")

## Called when the node enters the scene tree for the first time.
func _ready():
<<<<<<< HEAD
    
    var initial_piece = piece_scene.instantiate()
    initial_piece.setType("square")
    initial_piece.position = Vector2(112, 0)
    add_child(initial_piece)
    
    pass  # Replace with function body.
=======
	## Enables unhandled input (gameplay input) processing by the _unhandled_key_input virtual function.
	set_process_unhandled_key_input(true)
	pass  # Replace with function body.
>>>>>>> a69d3a858acfefbd812b6657abbf97f7f0bee27c


## Called when an InputEventKey hasn't been consumed by _input or any GUI Control item (i.e., gameplay input).
func _unhandled_key_input(event: InputEvent):
	pass


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


## This is the game's main loop called every game tick. It is primarily responsible for updating the active piece's position (falling).
## The tick rate or speed of the game is determined by the current wait time of TickTimer.
func _on_tick():
	# TODO: speed up game -> decrease TickTimer wait time by percentage based on either points or
	pass  # Replace with function body.
