extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _get_enemies_in_area(area : Area2D) -> Array:
	var areas = area.get_overlapping_areas();
	var enemies = [];
	for a in areas:
		if a.owner is EnemyUnit:
			enemies.append(a.owner)
	return enemies