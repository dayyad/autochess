extends Node2D

var mainMenu : Node2D
var mainMenuPrefab = preload("res://scenes/MainMenu/MainMenu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	StateController.connect("open_main_menu", self, "open_main_menu")
	StateController.connect("close_main_menu", self, "close_main_menu")
	open_main_menu()
	pass # Replace with function body.

func close_main_menu():
	mainMenu.queue_free()
	pass
	
func open_main_menu():
	print("aasdsda")
	mainMenu = mainMenuPrefab.instance()
	add_child(mainMenu)
	pass