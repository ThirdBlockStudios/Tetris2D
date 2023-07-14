## This class contains the majority of game logic.
class_name MainScript
extends Node


## Called when the node enters the scene tree for the first time.
func _ready():
	## Enables unhandled input (gameplay input) processing by the _unhandled_key_input virtual function.
	set_process_unhandled_key_input(true)
	pass  # Replace with function body.


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
