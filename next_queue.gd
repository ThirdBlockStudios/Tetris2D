class_name NextQueue
extends TileMap

var queue : Array[int]

func initialize(q: Array[int]):
    self.clear()
    queue = q
    render_pieces()

func render_pieces():
    var y_offset = 0
    for index in queue:
        var data = GameData.TETROMINOES[index]
        var tile_id = data.tile_id
        var blocks = data.block_grid_coordinates
        var rotation_offset = data.rotation_center_offset
        for b in blocks:
            set_cell(0, Vector2i(b.x, b.y + (y_offset * 5)), tile_id, Vector2i(0, 0), 0)
        y_offset += 1
