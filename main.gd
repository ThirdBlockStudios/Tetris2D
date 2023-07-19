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

var tetrominoes = {
	GameData.TETROMINO.square: {},
	GameData.TETROMINO.tee: {},
	GameData.TETROMINO.l_left: {},
	GameData.TETROMINO.l_right: {},
	GameData.TETROMINO.zag_right: {},
	GameData.TETROMINO.zag_left: {},
	GameData.TETROMINO.line: {}
}


## Start game. Called when the node enters the scene tree for the first time.
func _ready():
	print("cosine:", GameData.cosine)
	print("sine:", GameData.sine)
	board = get_tree().get_first_node_in_group("board")
	piece = get_tree().get_first_node_in_group("piece")

	randomize()  # randomize rng seed

	# Set game constants (cell arrangements, tile type map)
	for i in GameData.TETROMINO:
		tetrominoes[GameData.TETROMINO[i]] = {
			"type": GameData.TETROMINO[i],
			"blocks": GameData.blocks[GameData.TETROMINO[i]],
			"tile_id": GameData.tile_ids[GameData.TETROMINO[i]],
			"center_offset": GameData.center_offset[GameData.TETROMINO[i]]
		}
	board.reset_board()
	spawn_piece()


func game_over():
	board.reset_board()
	spawn_piece()


#    held_piece = null
#    held_piece_board.clear()


func hold_piece(piece: Piece):
	# TODO
	pass


func spawn_piece():
	if next_queue.size() < queue_size:
		for i in range(queue_size - next_queue.size()):
			var random_int = randi() % tetrominoes.size()
			next_queue.append(random_int)
	var current_piece = next_queue.pop_front()
	var data = tetrominoes[current_piece]
	next_queue_board.initialize(next_queue)  # TODO
	piece.initialize(spawn_position, data)
#    print(piece.blocks.map(func (b): b.position + Vector2(4, 0)))
	if board.Board_isMoveValid(piece, spawn_position):
		board.Board_setPiece(piece)
	else:
		game_over()


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


## This is the game's main loop called every game tick. It is primarily responsible for updating the active piece's position (falling).
## The tick rate or speed of the game is determined by the current wait time of TickTimer.
func _on_tick():
	# TODO: speed up game -> decrease TickTimer wait time by percentage based on either points or
	pass  # Replace with function body.
