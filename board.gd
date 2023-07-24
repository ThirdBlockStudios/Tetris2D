# Class for main play area.
class_name MainBoard extends TileMap

# Constants

## Tile length in pixels.
const TILE_PIXEL_LENGTH = 32

## Game board dimensions.
const dimensions = Vector2i(10, 20)

## 2D representation of the board grid. Holds true for occupied locked tiles and 0/false for unnoccupied tiles.
var board = []

## Scenes and nodes.
var explosion_scene = load("res://explosion.tscn")
var explosion_node


## Clears the board on load.
func _ready():
    reset_board()


## Function to initialize/reset the game board.
func reset_board():
    self.clear()  # Clears the TileMap (MainBoard).
    board.clear()  # Clears the 2D game board.
    for x in range(dimensions.x):
        for y in range(dimensions.y):
            set_cell(
                GameData.Layers.BACKGROUND,
                Vector2i(x, y),
                GameData.Types.BACKGROUND,
                Vector2i(0, 0),
                0
            )
    for x in range(dimensions.x):
        board.append(Array())  # Create an array for each column.
        for y in range(dimensions.y):
            board[x].append(0)  # Initialize each cell with value 0.


## Function to draw a ghost piece on the board (used for indicating the landing position of the current piece).
func Board_drawGhost(piece: Piece):
    # Clear the '2' layer (ghost piece layer) on the TileMap.
    clear_layer(GameData.Layers.GHOST)

    # Calculate the ghost piece position (falling position) and store the blocks in 'ghost_blocks' list.
    var ghost_blocks = piece.blocks.map(func(block): return block + piece.position)

    # Move the ghost piece down until it collides with existing blocks or reaches the bottom of the board.
    var found_row = false
    while not found_row:
        for block in ghost_blocks:
            if block.y == -1:
                continue
            if block.y >= dimensions.y || board[block.x][block.y]:
                found_row = true
        if not found_row:
            for i in ghost_blocks.size():
                ghost_blocks[i] += Vector2.DOWN
        else:
            for i in ghost_blocks.size():
                ghost_blocks[i] += Vector2.UP

    # Draw the ghost blocks on the '1' layer with tile_id '7' (ghost tile).
    for block in ghost_blocks:
        set_cell(
            GameData.Layers.GHOST,
            Vector2i(block.x, block.y),
            GameData.Types.GHOST,
            Vector2i(0, 0),
            0
        )


## Function to set a piece on the game board (draw the current piece).
func Board_setPiece(piece: Piece, locked = false):
    for block_position in piece.blocks:
        var draw_position = block_position + piece.position
        if locked:
            board[draw_position.x][draw_position.y] = true
        set_cell(0, Vector2i(draw_position), piece.tile_id, Vector2i(0, 0), 0)


## Function to clear a piece from the game board.
func Board_clearPiece(piece: Piece):
    for block_position in piece.blocks:
        var erase_position = block_position + piece.position
        erase_cell(0, Vector2i(erase_position))


## Function to check if a move is valid for a given piece (collision detection).
func Board_isMoveValid(piece: Piece, translation: Vector2):
    for block_position in piece.blocks:
        var new_cell_position = block_position + translation
        if (
            new_cell_position.x < 0
            or new_cell_position.x >= dimensions.x
            or new_cell_position.y >= dimensions.y
        ):
            return false
        if (
            board[new_cell_position.x][new_cell_position.y]
            and new_cell_position.x >= 0
            and new_cell_position.y >= 0
        ):
            return false
    return true


## Function to check if a row is full.
func Board_isRowFull(row: int) -> bool:
    var is_full = true
    for cols in dimensions.x:
        is_full = is_full and board[cols][row]
    return is_full


## Function to clear a row by setting its cells to false (empty).
## order is an optional parameter to handle multi-row clear animations.
func Board_clearRow(row: int, order: int = 0):
    for cols in dimensions.x:
        # First handle the clearing animations.
        explosion_node = explosion_scene.instantiate()
        add_child(explosion_node)
        # We need to account for centering offsets using TILE_PIXEL_LENGTH.
        var local_coordinates = map_to_local(Vector2i(cols, row))
        local_coordinates.x = local_coordinates.x - (TILE_PIXEL_LENGTH / 2)
        local_coordinates.y = (
            local_coordinates.y - (order * TILE_PIXEL_LENGTH) - (TILE_PIXEL_LENGTH / 2)
        )
        explosion_node.Explosion_updateCoordinates(local_coordinates)
        explosion_node.Explosion_start()

        # Then update board state and Tilemap rendering.
        board[cols][row] = false
        erase_cell(0, Vector2i(cols, row))


## Recursive function to update the board state given a starting row and a step size.
## It moves the blocks down by 'step' rows.
func Board_updateRow(row: int, step: int):
    # Recursion base case: row is below 0.
    if row < 0:
        return
    else:
        for cols in dimensions.x:
            # Update a piece if it exists in the cell.
            if board[cols][row]:
                board[cols][row] = false
                var new_row = row + step
                board[cols][new_row] = true
                # Update the TileMap by rendering the new position and erasing the old one.
                set_cell(
                    0,
                    Vector2i(cols, new_row),
                    get_cell_source_id(0, Vector2i(cols, row)),
                    Vector2i(0, 0),
                    0
                )
                erase_cell(0, Vector2i(cols, row))
        # Process the rows above (recursively).
        Board_updateRow(row - 1, step)


## Function to process the current tiles on the board and handle clearing full rows.
func Board_playTiles():
    var current_row = dimensions.y - 1  # Start from the bottom row.
    var rows_cleared = 0
    while current_row >= 0:
        if Board_isRowFull(current_row):
            Board_clearRow(current_row, rows_cleared)
            rows_cleared += 1
            Board_updateRow(current_row, 1)  # Move the rows above down by 1 step.
        else:
            current_row -= 1  # Move to the row above.

    # Play different clear sounds based on the number of rows cleared.
    match rows_cleared:
        4:
            $ClearFourSound.play()
        3:
            $ClearThreeSound.play()
        2:
            $ClearTwoSound.play()
        1:
            $ClearOneSound.play()
