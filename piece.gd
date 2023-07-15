class_name Piece

extends Node2D

@export var block_scene: PackedScene

## Represents piece type as name of piece.
var type: int

## Holds block arrangements as JSON.
var block_type_data

## Loads block colors.
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
    block_scene.connect("body_entered", _on_collide)
    
    block_type_data = [
        {
            "name": "square",
            "block_positions": [
                $block_position_a2.position, 
                $block_position_a3.position, 
                $block_position_b2.position, 
                $block_position_b3.position
            ],
            "rotation_center": $rotation_center_1,
            "initial_offset": Vector2(-16, -16)
        },
        {
            "name": "tee",
            "block_positions": [
                $block_position_a2.position,
                $block_position_b1.position, 
                $block_position_b2.position, 
                $block_position_b3.position
            ],
            "rotation_center": $rotation_center_2            
        },
        {
            "name": "l_right",
            "block_positions": [
                $block_position_a3.position,
                $block_position_b1.position, 
                $block_position_b2.position, 
                $block_position_b3.position
            ],
            "rotation_center": $rotation_center_2            
        },
        {
            "name": "l_left",
            "block_positions": [
                $block_position_a1.position,
                $block_position_b1.position, 
                $block_position_b2.position, 
                $block_position_b3.position
            ],
            "rotation_center": $rotation_center_2            
        },
        {
            "name": "zag_right",
            "block_positions": [
                $block_position_a2.position,
                $block_position_a3.position, 
                $block_position_b1.position, 
                $block_position_b2.position 
            ],
            "rotation_center": $rotation_center_2            
        },
        {
            "name": "zag_left",
            "block_positions": [
                $block_position_a1.position,
                $block_position_a2.position, 
                $block_position_b2.position, 
                $block_position_b3.position 
            ],
            "rotation_center": $rotation_center_2
        },
        {
            "name": "line",
            "block_positions": [
                $block_position_b1.position,
                $block_position_b2.position, 
                $block_position_b3.position, 
                $block_position_b4.position 
            ],
            "rotation_center": $rotation_center_3,
            "initial_offset": Vector2(-16, -16)
        }
    ]
    
    setBlockPositions()  # Add, places, and groups (for reference purposes) blocks
    setBlockRotationCenters()  # Orient child blocks to (0,0)
    setBlockTextures()  # Color blocks

    # Aligns pieces with rotation centers not in centers of blocks
    if (block_type_data[type].get("initial_offset") != null):
        self.position += block_type_data[type].initial_offset
        
    print(block_type_data[type].name) # Remove after testing.

    $Ticker.start()  # Fall


## Handles non UI player input keys.
func _unhandled_key_input(event: InputEvent):
    if event.is_action_pressed("ui_up"):
        rotate(PI / 2)
    if event.is_action_pressed("ui_left"):
        self.position += Vector2(-32, 0)
    if event.is_action_pressed("ui_right"):
        self.position += Vector2(32, 0)
    rotation_degrees


## Allows setting piece type which trickles down to block arrangement, color, etc.
func setType(type_name: int):
    type = type_name


## Instantiates, groups, and positions blocks. Grouping allows referencing the block nodes by group in the rest of the class.
func setBlockPositions():
    for i in 4:        
        var block = block_scene.instantiate()
        block.position = block_type_data[type].block_positions[i]
        block.add_to_group("blocks")
        add_child(block)


## In order for blocks to correctly rotate, child block nodes are moved based block type to center around the center of the parent node (0,0).
func setBlockRotationCenters():
    var rotation_adjustment = Vector2(0, 0) - block_type_data[type].rotation_center.position
    for child in get_children():
        if child.is_in_group("blocks"):
            child.position += rotation_adjustment


## Color blocks.
func setBlockTextures():
    for child in get_children():
        if child.is_in_group("blocks"):
            child.get_node("Sprite2D").texture = block_textures[type]  # Textures autoloaded

func _on_collide(sig: Signal):
    print("collided")

## Controls piece falling.
func _on_tick():
    self.position += Vector2(0, 32)
