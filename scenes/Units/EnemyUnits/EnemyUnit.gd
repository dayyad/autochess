extends Unit
class_name EnemyUnit

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy_units")
	pass # Replace with function body.
	
func look_for_target():
	var possible_targets = CollisionController._get_player_units_in_area($DetectorArea)
	if possible_targets.size() > 0:
		target_unit = possible_targets[0]
	else:
		target_unit = null
	
func attack_target():
	target_unit._do_damage(10)
	pass