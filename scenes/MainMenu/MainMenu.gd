extends Node2D
var board_1 = preload("res://scenes/Boards/Board.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func request_board_open():
	StateController.request_board_open(board_1);
	pass # Replace with function body.


func request_shop_open():
	StateController.request_shop_open();
	pass # Replace with function body.
