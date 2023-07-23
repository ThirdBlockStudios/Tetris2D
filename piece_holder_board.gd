class_name PieceHolderBoard
extends TileMap

# Local variables.
var pieceHolder: PieceHolder


func _ready():
    pieceHolder = preload("res://piece_holder.gd").new()
    self.clear()


## Use the default spawn positions to render given piece.
func PieceHolderBoard_render(held_piece: GameData.TETROMINO):
    self.clear()
    if held_piece is GameData.TETROMINO:
        for block_position in GameData.blocks[held_piece]:
            set_cell(0, block_position, held_piece, Vector2i(0, 0), 0)
