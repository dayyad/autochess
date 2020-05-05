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
	
func handle_click():
	pass

func get_areas_under_mouse() -> Array:
	var areas = []
	areas = click.get_overlapping_areas()
	return areas


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
