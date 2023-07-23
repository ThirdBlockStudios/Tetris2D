class_name PieceHolder
extends Node

# Local variables.
var stored_piece: int = -1


## Holds a given piece.
func PieceHolder_holdPiece(piece: int):
    print("Storing %d" % piece)
    stored_piece = piece


## Retrieves a stored piece if it exists.
func PieceHolder_getPiece():
    print("Getting %d" % stored_piece)
    return stored_piece
