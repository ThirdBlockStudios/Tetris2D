class_name Explosion
extends Node2D

# Local variables.
@onready var animated_sprite = $AnimatedSprite2D


## Signal emitted by AnimationSprite2D.animation_finished(). Without this, the
## animation will loop.
func Explosion_stop():
    animated_sprite.stop()
    queue_free()


## Moves the current animation position to coordinates (px).
func Explosion_updateCoordinates(coordinates: Vector2i):
    self.position.x = coordinates.x
    self.position.y = coordinates.y


## Starts the animation.
func Explosion_start(delay_in_seconds: float):
    await await get_tree().create_timer(delay_in_seconds).timeout
    animated_sprite.play()
