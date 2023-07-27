class_name Lines
extends Label


func _process(_delta):
    self.text = "Lines: " + str(Global.lines)
