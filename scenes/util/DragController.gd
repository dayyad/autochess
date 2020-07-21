extends Node

var mouse_area = preload("res://scenes/util/MouseArea.tscn")
var click;
# Called when the node enters the scene tree for the first time.
func _ready():
	click = mouse_area.instance()
	add_child(click)
	pass # Replace with function body.

func _process(delta):
	click.position = get_viewport().get_mouse_position()
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		handle_click()
	elif unit_in_hand != null:
		drop_dragged_unit()
		pass
	
func handle_click():
	if StateController.state == StateController.BOARD:
		handle_board_click()
	pass

func get_areas_under_mouse() -> Array:
	var areas = []
	areas = click.get_overlapping_areas()
	return areas
	
# Unit that is either about to be dragged or currently being dragged
var unit_in_hand : Unit = null

# WHen a user stops holding the mouse do the dropping logic if something was being dragged
func drop_dragged_unit():
	unit_in_hand._link_to_tile_beneath()
	MoveController.tween_unit_to_tile(unit_in_hand, unit_in_hand.on_tile)
	unit_in_hand = null

#  Called every frame that mouse is held down while on board
func handle_board_click():
	# If alreadty dragging then we just want to update the position of the dragged item.
	if unit_in_hand != null:
		# update position
		unit_in_hand.global_position = click.position
		print(unit_in_hand.position)
		return
	
	var possible_units = CollisionController._get_player_units_in_area(click)
	if possible_units.size() >= 1:
		unit_in_hand = possible_units[0]
	
