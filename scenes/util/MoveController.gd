extends Node

onready var tween = Tween.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(tween)
	pass # Replace with function body.

func tween_unit_to_tile(unit : Unit, tile : Tile):
	tween.interpolate_property(unit, "global_position",
		Vector2(unit.global_position.x, unit.global_position.y), Vector2(tile.global_position.x , tile.global_position.y), 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	pass
