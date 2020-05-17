extends Node2D
class_name UnitShop

var prices = {"AntUnit":1};
var inventory = {"AntUnit":3}
var unit_shop_slot = preload("res://scenes/Shop/PurchasableUnit.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var i =  0
	for unit_label in inventory:
		for x in range(inventory[unit_label]):
			var unit_slot = unit_shop_slot.instance()
			unit_slot.set_unit(unit_label)
			unit_slot.price = prices[unit_label]
			var start_pos = $UnitsForSale.position
			$UnitsForSale.add_child(unit_slot)
			unit_slot.position = Vector2((80 * i), start_pos.y)
			unit_slot.connect("unit_bought", self, "buy_unit")
			i += 1

func _process(delta):
	$PlayerGold.text = "Gold: " + str(InventoryController.gold)

func buy_unit(unit : PurchasableUnit):
	if(InventoryController.gold >= unit.price):
		InventoryController.gold -= unit.price
		unit.remove_child(unit.unit)
		InventoryController.add_unit(unit.unit)
		unit.queue_free();
		
	pass
	

func request_shop_close():
	StateController.request_main_menu_open()
	pass 
