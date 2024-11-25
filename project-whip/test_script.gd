extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x < 10:
		position += Vector2(1,1)
	
