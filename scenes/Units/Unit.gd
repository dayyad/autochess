extends Node2D
class_name Unit

var max_health = 100.0;
var health = 100.0;
var on_tile : Tile = null;
var target_unit : Unit = null;

const RESTING = 0;
const PLAYING = 1;

var state = RESTING;

func _ready():
	add_to_group("units")
	pass

var time_since_target_check = 0;
var time_between_target_check = 0.1;	

var time_since_attack = 0;
var time_between_attack = 1;

var time_since_move = randf();
var time_between_move = 1;

func _physics_process(delta):
	if on_tile == null || state != PLAYING:
		return
	
	time_since_target_check += delta
	if time_since_target_check >= time_between_target_check && target_unit == null:
		time_since_target_check = 0
		look_for_target()
		
	time_since_move += delta
	if time_since_move >= time_between_move && target_unit == null:
		time_since_move = 0
		attempt_move()
		
	time_since_attack += delta
	if time_since_attack >= time_between_attack && target_unit != null:
		time_since_attack = 0
		attack_target()
		
	pass	
var rng = RandomNumberGenerator.new()
func attempt_move():
	var empty_tiles = CollisionController._get_empty_tiles_in_area($DetectorArea)
	if empty_tiles.size() > 0:
		var tile : Tile = empty_tiles[rng.randi_range(0, empty_tiles.size()-1)]
		on_tile._set_tile_empty(true)
		on_tile = tile;
		on_tile._set_tile_empty(false)
		MoveController.tween_unit_to_tile(self, tile)
func attack_target():
	
	pass

func look_for_target():
	
	pass

func _game_loaded():
	var empty_tiles = CollisionController._get_empty_tiles_in_area($UnitArea);
	if(empty_tiles.size() > 0):
		var tile : Tile = empty_tiles[0];
		tile._set_tile_empty(false)
		on_tile = tile
	pass

func _do_damage(damage):
	health -= damage
	if health <= 0:
		if on_tile != null:
			on_tile._set_tile_empty(true)
		queue_free()
		get_tree().call_group("units", "unit_died", self);
	pass
	
func unit_died(unit):
	if target_unit == unit:
		target_unit = null
	pass
	
func round_started():
	state = PLAYING

func round_over():
	state = RESTING