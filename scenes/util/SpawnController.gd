extends Node

var antUnit = preload("res://scenes/Units/PlayerUnits/AntUnit.tscn")
var units = {"AntUnit": antUnit}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func get_unit(unit) -> Unit:
	return units[unit]
