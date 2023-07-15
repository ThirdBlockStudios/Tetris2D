class_name Board
extends TileMap

# Local variables.
var dimensions = Vector2i(10, 20)
var board = []


## Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(dimensions.x):
		board.append(Array())
		for y in range(dimensions.y):
			board[x].append(0)
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
	if row < 0:
		return
	else:
		for cols in dimensions.x:
			if board[cols][row]:
				board[cols][row] = false
				var new_row = row + step
				board[cols][new_row] = true
				set_cell(
					0,
					Vector2i(cols, new_row),
					get_cell_source_id(0, Vector2i(cols, row)),
					Vector2i(0, 0),
					0
				)
				erase_cell(0, Vector2i(cols, row))
		Board_updateRow(row - 1, step)


## Piece processing logic when we need to update the board state.
func Board_playTiles():
	# Testing clearing by hardcoding a 5-high I block with base at (8, 19).
	var hardcode_block_x = 8
	var hardcode_block_y = 19

	# Rendering.
	set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y), 0, Vector2i(0, 0), 0)
	set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y - 1), 0, Vector2i(0, 0), 0)
	set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y - 2), 0, Vector2i(0, 0), 0)
	set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y - 3), 0, Vector2i(0, 0), 0)
	set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y - 4), 0, Vector2i(0, 0), 0)
	board[hardcode_block_x][hardcode_block_y] = true
	board[hardcode_block_x][hardcode_block_y - 1] = true
	board[hardcode_block_x][hardcode_block_y - 2] = true
	board[hardcode_block_x][hardcode_block_y - 3] = true
	board[hardcode_block_x][hardcode_block_y - 4] = true

	var rows_processed = 0

	# Processing from the bottom to the top.
	while rows_processed < hardcode_block_y:
		if Board_isRowFull(hardcode_block_y - rows_processed):
			Board_clearRow(hardcode_block_y - rows_processed)
			Board_updateRow(hardcode_block_y - rows_processed, 1)
		else:
			rows_processed += 1
