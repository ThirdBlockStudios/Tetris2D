class_name Explosion
extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var test = false

#func _process(delta):
#	# Change the animation with keeping the frame index and progress.
##	if Input.is_action_pressed("hard_drop"):
#	if test:
#		animated_sprite.play()


func _ready():
	print("ready")


#	animated_sprite.play()


func Explosion_stop():
	animated_sprite.stop()


#	test = false


func Explosion_updateCoords(coords: Vector2i, order):
	self.position.x = coords.x - 16.25
	self.position.y = coords.y - (order * 32) - 16.25


func Explosion_start():
#	test = true
	animated_sprite.play()
