class_name MainBoard
extends TileMap

# Local variables.

# Game dimensions.
var dimensions = Vector2i(10, 20)

# 2D game board to store piece positions and state.
var board = []

## Called when the node enters the scene tree for the first time.
func _ready():
    reset_board()


func reset_board():
    board.clear()
    for x in range(dimensions.x):
        board.append(Array())
        for y in range(dimensions.y):
            board[x].append(0)


func Board_setPiece(piece: Piece, locked = false):
    for block_position in piece.blocks:
        var draw_position = block_position + piece.position
        if locked:
            printBoard()
            board[draw_position.x][draw_position.y] = true
        set_cell(0, Vector2i(draw_position), piece.tile_id, Vector2i(0, 0), 0)


func printBoard():
    for col in dimensions.x:
        print(board[col])


func Board_clearPiece(piece: Piece):
    for block_position in piece.blocks:
        var erase_position = block_position + piece.position
        erase_cell(0, Vector2i(erase_position))


func Board_isMoveValid(piece: Piece, translation: Vector2):
    for block_position in piece.blocks:
        var new_cell_position = block_position + translation
        if new_cell_position.x < 0 or new_cell_position.x >= dimensions.x or new_cell_position.y >= dimensions.y:
            return false
        if board[new_cell_position.x][new_cell_position.y]: # and tile_position.y >= 0 and tile_position.x >= 0:
            return false
    return true

## Checks if the given row is full.
func Board_isRowFull(row: int) -> bool:
    var is_full = true
    for cols in dimensions.x:
        is_full = is_full and board[cols][row]
    return is_full


## Clears the given row.
func Board_clearRow(row: int):
    for cols in dimensions.x:
        board[cols][row] = false
        erase_cell(0, Vector2i(cols, row))


## Recursively updates the board given a starting row. A step size can be
## optionally provided.
## TODO(nkuang): default step to 1 as an optional parameter.
func Board_updateRow(row: int, step: int):
    # Recursion base case.
    if row < 0:
        return
    else:
        for cols in dimensions.x:
            # We only need to update a piece if it exists.
            if board[cols][row]:
                board[cols][row] = false
                var new_row = row + step
                board[cols][new_row] = true
                # Update by rendering the new position and erasing the old.
                set_cell(
                    0,
                    Vector2i(cols, new_row),
                    get_cell_source_id(0, Vector2i(cols, row)),
                    Vector2i(0, 0),
                    0
                )
                erase_cell(0, Vector2i(cols, row))
        # Process the rows above.
        Board_updateRow(row - 1, step)


## Piece processing logic when we need to update the board state.
func Board_playTiles():
    var current_row = dimensions.y - 1 # start at bottom
    # Processing from the bottom to the top.
    while current_row >= 0:
        if Board_isRowFull(current_row):
            Board_clearRow(current_row)
            Board_updateRow(current_row, 1)
        else:
            current_row -= 1