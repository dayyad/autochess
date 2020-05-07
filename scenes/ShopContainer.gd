extends Node2D

var shopPrefab = preload("res://scenes/Shop/UnitShop.tscn")
var shop : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	StateController.connect("open_shop", self, "open_shop")
	StateController.connect("close_shop", self, "close_shop")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open_shop():
	shop = shopPrefab.instance()
	add_child(shop)
	pass
	
func close_shop():
	shop.queue_free()
	pass
