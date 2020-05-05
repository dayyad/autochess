extends Node2D
class_name PurchasableUnit

var unit : Unit = null
var price = 0

signal unit_bought

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_unit(unit_label):
	unit = SpawnController.get_unit(unit_label).instance()
	unit.set_name("Unit")
	add_child(unit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Button.text = "Buy $"+str(price)

func buy_pressed():
	emit_signal("unit_bought", self)
	pass

