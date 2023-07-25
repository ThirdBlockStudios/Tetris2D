## This class contains the majority of game logic.
class_name MainScript
extends Node

#@onready var held_piece_board = get_tree().get_first_node_in_group('held_piece')
@onready var next_queue_board = get_tree().get_first_node_in_group("next_queue")

var board: MainBoard
var piece: Piece
var held_piece

var queue_size = 5
var next_queue: Array[int] = []

var spawn_position = Vector2(4, 0)

var game_data
var TETROMINOES


func _init():
    game_data = GameData.new()
    TETROMINOES = game_data.TETROMINOES


## Start game. Called when the node enters the scene tree for the first time.
func _ready():
    board = get_tree().get_first_node_in_group("board")
    piece = get_tree().get_first_node_in_group("piece")
    var tile_set_copy = board.tile_set
    get_tree().get_first_node_in_group("piece_holder_board").tile_set = tile_set_copy
    
    spawn_position = Vector2(floori(board.dimensions.x / 2), 0)

    randomize()  # randomize rng seed

    board.reset_board()
    spawn_piece()


func game_over():
    $GameOverSound.play()
    board.reset_board()
    spawn_piece()


#    held_piece = null
#    held_piece_board.clear()


## Adds a piece to the front of the next queue.
func next_queue_push_front(input_piece: int):
    next_queue.push_front(input_piece)


func spawn_piece():
    if next_queue.size() < queue_size:
        for i in range(queue_size - next_queue.size()):
#            var random_int = randi() % TETROMINOES.size()
            var random_int = 6
            next_queue.append(random_int)
    var current_piece = next_queue.pop_front()
    var data = TETROMINOES[current_piece]
    next_queue_board.initialize(next_queue)  # TODO
    piece.initialize(spawn_position, data)
    if board.Board_isMoveValid(piece, spawn_position):
        board.Board_setPiece(piece)
    else:
        game_over()


## This is the game's main loop called every game tick. It is primarily responsible for updating the active piece's position (falling).
## The tick rate or speed of the game is determined by the current wait time of TickTimer.
func _on_tick():
    # TODO: speed up game -> decrease TickTimer wait time by percentage based on either points or
    pass  # Replace with function body.
