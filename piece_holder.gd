class_name PieceHolder
extends Node

# Local variables.
var stored_piece = null


## Holds a given piece.
func PieceHolder_holdPiece(piece: GameData.TETROMINO):
    stored_piece = piece


## Retrieves a stored piece if it exists.
func PieceHolder_getPiece():
    return stored_piece
