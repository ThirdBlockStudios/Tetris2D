class_name PieceHolderBoard
extends TileMap

# Local variables.
var pieceHolder: PieceHolder

var original_position

func _init():
    original_position = position 

func _ready():
    pieceHolder = preload("res://piece_holder.gd").new()
    self.clear()


## Use the default spawn positions to render given piece.
func PieceHolderBoard_render(held_piece: GameData.Types):
    position = original_position
    self.clear()
    if held_piece < GameData.Types.DEFAULT:
        position += GameData.TETROMINOES[held_piece].rotation_center_offset * Global.tile_size
        for block_position in GameData.TETROMINOES[held_piece].block_grid_coordinates:
            set_cell(0, block_position, GameData.TETROMINOES[held_piece].tile_id, Vector2i(0, 0), 0)
