extends Tile
class_name InventoryTile

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Checks that no unit is standing here
func _is_tile_empty():
	return empty
	#return CollisionController._get_units_in_area($Area2D).size() == 0

func _set_tile_empty(e):
	empty = e