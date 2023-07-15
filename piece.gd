class_name Piece

extends Node2D

@export var block_scene : PackedScene

## Represents piece type as name of piece
var type : int

## Holds block arrangements as JSON
var block_type_data

## Loads block colors
var block_textures = [
    preload("res://assets/Yellow.png"),
    preload("res://assets/Purple.png"),
    preload("res://assets/Orange.png"),
    preload("res://assets/Blue.png"),
    preload("res://assets/Green.png"),
    preload("res://assets/Red.png"),
    preload("res://assets/Cyan.png")
]

## Initialize piece.
func _ready():
    block_type_data = [
        {
            "name":"square",
            "variable_block_positions":[
                $variable_block_position_1.position,
                $variable_block_position_2.position
            ],
            "rotation_center":$rotation_center_1,
            "initial_offset":Vector2(-16, -32)
        },
        {
            "name":"tee",
            "variable_block_positions":[
                $variable_block_position_2.position,
                $variable_block_position_4.position
            ],
            "rotation_center":$rotation_center_2,
            "initial_offset":Vector2(0, -16)
        },
        {
            "name":"l_right",
            "variable_block_positions":[
                $variable_block_position_3.position,
                $variable_block_position_5.position
            ],
            "rotation_center":$rotation_center_2,
            "initial_offset":Vector2(0, -48)
        },
        {
            "name":"l_left",
            "variable_block_positions":[
                $variable_block_position_1.position,
                $variable_block_position_5.position
            ],
            "rotation_center":$rotation_center_2,
            "initial_offset":Vector2(0, -48)
        },
        {
            "name":"zag_right",
            "variable_block_positions":[
                $variable_block_position_3.position,
                $variable_block_position_2.position
            ],
            "rotation_center":$rotation_center_2,
            "initial_offset":Vector2(0, -16)
        },
        {
            "name":"zag_left",
            "variable_block_positions":[
                $variable_block_position_1.position,
                $variable_block_position_4.position
            ],
            "rotation_center":$rotation_center_2,
            "initial_offset":Vector2(0, -16)
        },
        {
            "name":"line",
            "variable_block_positions":[
                $variable_block_position_5.position,
                $variable_block_position_6.position
            ],
            "rotation_center":$rotation_center_3,
            "initial_offset":Vector2(-16, -64)
        }
    ]
    self.position += block_type_data[type].initial_offset ## Offsets to align bottom at start
    setVariableBlockPositions() ## Add blocks
    setBlockRotationCenters() ## Orient child blocks to (0,0)
    setBlockTextures() ## Color blocks
    
    print(block_type_data[type].name)
    
    $Ticker.start() ## Fall

## Handles non UI player input keys
func _unhandled_key_input(event: InputEvent):
    if (event.is_action_pressed("ui_up")):
        rotate(PI / 2)
    if (event.is_action_pressed("ui_left")):
        self.position += Vector2(-32, 0)
    if (event.is_action_pressed("ui_right")):
        self.position += Vector2(32, 0)
    rotation_degrees

## Allows setting piece type which trickles down to block arrangement, color, etc.
func setType(type_name: int):
    type = type_name

## Instantiates and positions variably positioned blocks
func setVariableBlockPositions():
    var block1 = block_scene.instantiate()
    var block2 = block_scene.instantiate()
    block1.position = block_type_data[type].variable_block_positions[0]
    block2.position = block_type_data[type].variable_block_positions[1]
    block1.add_to_group("blocks")
    block2.add_to_group("blocks")
    add_child(block1)
    add_child(block2)

## In order for blocks to correctly rotate, child block nodes are moved based block type to center around (0,0) 
func setBlockRotationCenters():
    var rotation_adjustment = Vector2(0,0) - block_type_data[type].rotation_center.position
    for child in get_children():
        if child.is_in_group("blocks"):
            child.position += rotation_adjustment

func setBlockTextures():
    for child in get_children():
        if child.is_in_group("blocks"):
            child.get_node("Sprite2D").texture = block_textures[type] ## Textures autoloaded
            pass
    pass

## Controls piece falling
func _on_tick():
    self.position += Vector2(0, 32)
