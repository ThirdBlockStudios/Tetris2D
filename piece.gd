class_name Piece
extends Node2D

@export var block_scene: PackedScene

## Represents piece type as name of piece.
var type: int
var tile_map: TileMap
var blocks: Array[Vector2i]

## Holds block arrangements as JSON.
var block_type_data

## Controls piece falling.
func _on_tick():
    self.position += Vector2(0, 1)
