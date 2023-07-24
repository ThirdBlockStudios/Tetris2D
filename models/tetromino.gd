## Base tetromino class
class_name Tetromino

var tile_id: int  ## Id of the tile map sprite used to draw tetromino. Defaults to 0 (yellow sprite).
var block_grid_coordinates: Array[Vector2] = []  ## Tile coordinates (in tile map grid format) of the blocks that make up the tetromino.
var rotation_center_offset: Vector2  ## Offset (from 0, 0?) around which the blocks of the piece rotate. Defaults to (0, 0).


## Constructor called on Tetromino.new()
func _init(
	tile_id: int,
	block_grid_coordinates: Array[Vector2],
	rotation_center_offset: Vector2 = Vector2(0, 0)
):
	self.tile_id = tile_id
	self.block_grid_coordinates = block_grid_coordinates
	self.rotation_center_offset = rotation_center_offset
