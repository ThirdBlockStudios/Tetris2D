class_name Board
extends TileMap

var x_pos = 0
var y_pos = 0
var er = false


## Called when the node enters the scene tree for the first time.
func _ready():
	x_pos = 0
	y_pos = 0
	set_cell(0, Vector2i(x_pos, y_pos), 0, Vector2i(0, 0), 0)


## Updates the board.
func Board_update():
	pass


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Process 10 tiles at a time. Looping draw/erase.
	for i in range(10):
		y_pos = (y_pos + 1)

		if y_pos > 40:
			y_pos = 0
			x_pos += 1

		if x_pos > 30:
			x_pos = 0
			y_pos = 0
			er = not er

		if er:
			erase_cell(0, Vector2i(x_pos, y_pos))
		else:
			set_cell(0, Vector2i(x_pos, y_pos), 0, Vector2i(0, 0), 0)
