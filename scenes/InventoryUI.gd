extends Node2D

var invTile = preload("res://scenes/Tiles/InventoryTile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	InventoryController.connect("units_changed", self, "units_changed")
	fill_UI_from_inventory()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func units_changed(units : Array):
	fill_UI_from_inventory()
	pass

func clear_inventory():
	for i in $InventoyTiles.get_child_count():
		remove_child($InventoyTiles.get_child(i))
	for i in $Units.get_child_count():
		remove_child($Units.get_child(i))

func fill_UI_from_inventory():
	clear_inventory()
	
	var units = InventoryController.get_units()
	for i in range(units.size()):
		var unit = units[i]
		var tile = invTile.instance()
		$InventoyTiles.add_child(tile)
		var newPos = Vector2(i * 100, 100)
		tile.position= newPos;
		$Units.add_child(unit)
		unit.position = newPos