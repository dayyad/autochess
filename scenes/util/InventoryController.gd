extends Node

signal units_changed

var units = [];
var gold = 10;

func _ready():
	pass # Replace with function body.

func add_unit(unit : Unit):
	units.append(unit)
	emit_signal("units_changed", units);
	
func remove_unit(unit : Unit):
	var index = units.find(unit)
	if index >= 0:
		units.remove(units.find(unit));
	emit_signal("units_changed", units);

func set_units(new_units : Array):
	units = new_units
	
func get_units() -> Array:
	return units 