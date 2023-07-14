class_name Piece

extends Node2D

@export var block_scene : PackedScene

var type
func setType(type_name: String):
    type = type_name

## Initialize blocks.
func _ready():
    var piece_types = {
        "square": {
            "width": 2,
            "positions": [
                $pos_1,
                $pos_2
            ]
        },
        "l-right": {
            "width": 2,
            "positions": [
                $pos_3,
                $pos_5
            ]
        }
    }
    ## Enables unhandled input (gameplay input) processing by the _unhandled_key_input virtual function.
    set_process_unhandled_key_input(true)
    $Ticker.start()
    
    var block1 = block_scene.instantiate()
    var block2 = block_scene.instantiate()
    print(piece_types[type].positions[0])
    block1.position = piece_types[type].positions[0]
    block2.position = piece_types[type].positions[1]
    add_child(block1)
    add_child(block2)
    
    pass

func _unhandled_key_input(event: InputEvent):
    if (event.is_action_pressed("left")):
        self.position += Vector2(-32, 0)
    if (event.is_action_pressed("right")):
        self.position += Vector2(32, 0)
    var didCollide = false
#    if (newPosition.x < 0 or newPosition.x > 320):
#        didCollide = true
    pass

func _on_tick():
    self.position += Vector2(0, 32)
    pass # Replace with function body.
