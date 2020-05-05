extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _get_empty_tiles_in_area(area : Area2D) -> Array:
	var tiles = []
	for a in area.get_overlapping_areas():
		if a.owner is Tile && a.owner._is_tile_empty() :
			tiles.append(a.owner)
	
	return tiles

func _get_units_in_area(area : Area2D) -> Array:
	var units = []
	for a in area.get_overlapping_areas():
		if a.owner is Unit:
			units.append(a.owner)
	return units

func _get_enemy_units_in_area(area : Area2D) -> Array:
	var enemy_units = [];
	for a in area.get_overlapping_areas():
		if a.owner is EnemyUnit:
			enemy_units.append(a.owner)
		
	return enemy_units;
	
func _get_player_units_in_area(area : Area2D) -> Array:
	var player_units = []
	for a in area.get_overlapping_areas():
		if a.owner is PlayerUnit:
			player_units.append(a.owner)
	return player_units