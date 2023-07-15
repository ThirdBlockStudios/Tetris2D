class_name Board
extends TileMap

var x_pos = 0
var y_pos = 0
var er = false

var dimensions = Vector2i(10, 20)
var board = []

## Called when the node enters the scene tree for the first time.
func _ready():
    x_pos = 0
    y_pos = 0
    set_cell(0, Vector2i(x_pos, y_pos), 0, Vector2i(0, 0), 0)
    
    for x in range(dimensions.x):
        board.append(Array())
        
        for y in range(dimensions.y):
            board[x].append(0)
    
    var used_cells = get_used_cells(0)
    
    for cell in used_cells:
        board[cell.x][cell.y] = true
        
func is_row_full(row: int) -> bool:
    var x = 0
#    if board.reduce(func(selected, cell): 
#        x += 1
#        return board[x][row] and selected
#        , true):
#            print("Row is full")
#            return true
#    else:
#        return false
    
    var is_full = true
    for cols in dimensions.x:
        is_full = is_full and board[cols][row]
        
    return is_full
    
func clear_row(row: int):
    for cols in dimensions.x:
        board[cols][row] = false
        erase_cell(0, Vector2i(cols, row))

func update_row(row: int, step: int):
    if (row < 0):
        return
    else:
        for cols in dimensions.x:
            if board[cols][row]:
                board[cols][row] = false
                var new_row = row + step
                board[cols][new_row] = true
                set_cell(0, Vector2i(cols, new_row), get_cell_source_id(0, Vector2i(cols, row)), Vector2i(0, 0), 0)
                erase_cell(0, Vector2i(cols, row))
        update_row(row - 1, step)

## Updates the board.
func Board_update():
    pass


## Called every frame. 'delta' is the elapsed time since the previous frame.
func play_tiles():
    # Testing clearing
    var used_cells = get_used_cells(0)
    
    var hardcode_block_x = 8
    var hardcode_block_y = 19
    
    set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y), randi() % 7, Vector2i(0, 0), 0)
    set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y-1), randi() % 7, Vector2i(0, 0), 0)
    set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y-2), randi() % 7, Vector2i(0, 0), 0)
    set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y-3), randi() % 7, Vector2i(0, 0), 0)
    set_cell(0, Vector2i(hardcode_block_x, hardcode_block_y-4), randi() % 7, Vector2i(0, 0), 0)
    board[hardcode_block_x][hardcode_block_y] = true
    board[hardcode_block_x][hardcode_block_y-1] = true
    board[hardcode_block_x][hardcode_block_y-2] = true
    board[hardcode_block_x][hardcode_block_y-3] = true
    board[hardcode_block_x][hardcode_block_y-4] = true
    
#    if (is_row_full(hardcode_block_y)):
#        clear_row(hardcode_block_y)
    
    var height = 5
    var rows_cleared = 0
    # Save topmost row that cleared\
    var i = 0
    
    while(i < hardcode_block_y):
        if (is_row_full(hardcode_block_y - i)):
            clear_row(hardcode_block_y - i)
            update_row(hardcode_block_y - i, 1)
        else:
            i += 1
        
#    while (is_row_full(hardcode_block_y - rows_cleared)):
#        clear_row(hardcode_block_y - rows_cleared)
#        rows_cleared += 1
#    if (rows_cleared > 0):
#        update_row(hardcode_block_y, rows_cleared)
    
#    print(used_cells)
    # Process 10 tiles at a time. Looping draw/erase.
#    for i in range(3):
##        y_pos = (y_pos + 1)
##
##        if y_pos > 40:
##            y_pos = 0
##            x_pos += 1
##
##        if x_pos > 30:
##            x_pos = 0
##            y_pos = 0
##            er = not er
#
#        x_pos = randi() % 30
#        y_pos = randi() % 40
#        er = not er
#        if er:
#            erase_cell(0, Vector2i(x_pos, y_pos))
#        else:
#            set_cell(0, Vector2i(x_pos, y_pos), randi() % 7, Vector2i(0, 0), 0)
