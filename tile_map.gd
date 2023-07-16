class_name Board
extends TileMap

# Local variables.

# Game dimensions.
var dimensions = Vector2i(10, 20)

# 2D game board to store piece positions and state.
var board = []



## Called when the node enters the scene tree for the first time.
func _ready():
    for x in range(dimensions.x):
        board.append(Array())
        for y in range(dimensions.y):
            board[x].append(0)
    # Mark all currently used cells in the board with their coordinates.
    var used_cells = get_used_cells(0)
    for cell in used_cells:
        board[cell.x][cell.y] = true


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
    var rows_processed = 0
    var bottom_most_row = dimensions.y - 1
    # Processing from the bottom to the top.
    while rows_processed < bottom_most_row:
        if Board_isRowFull(bottom_most_row - rows_processed):
            Board_clearRow(bottom_most_row - rows_processed)
            Board_updateRow(bottom_most_row - rows_processed, 1)
        else:
            rows_processed += 1
