class_name ClearAnimation
extends Node2D

# Local variables.
@onready var animated_sprite = $AnimatedSprite2D


## Signal emitted by AnimationSprite2D.animation_finished(). Without this, the
## animation will loop.
func ClearAnimation_stop():
    animated_sprite.stop()
    queue_free()


## Moves the current animation position to coordinates (px).
func ClearAnimation_updateCoordinates(coordinates: Vector2i):
    self.position.x = coordinates.x
    self.position.y = coordinates.y


## Starts the animation.
func ClearAnimation_start(delay_sec: float):
    await get_tree().create_timer(delay_sec).timeout
    animated_sprite.play()
