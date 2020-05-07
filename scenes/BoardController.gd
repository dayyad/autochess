extends Node2D

var board_1 = preload("res://scenes/Boards/Board.tscn")
var board_2 = preload("res://scenes/Boards/Board_2.tscn");
var current_board = null

var board_UI_prefab = preload("res://scenes/Boards/Board_UI.tscn")
var board_UI : Node2D

const REST = 0;
const RUNNING = 1;
var state = REST

func show_win_screen(winner):
	print(winner + " wins")
	get_tree().call_group("units","round_over")
	state = REST
	pass
	
func _process(delta):
	if(state == REST):
		return
	
	if get_tree().get_nodes_in_group("enemy_units").size() == 0:
		show_win_screen("enemy")
	if get_tree().get_nodes_in_group("player_units").size() == 0:
		show_win_screen("player")	

func start_round():
	state = RUNNING
	get_tree().call_group("units","round_started")
	pass # Replace with function body.

var once = false
var twice = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	StateController.connect("open_board", self, "open_board")
	StateController.connect("close_board", self, "close_board")
	pass # Replace with function body.

func _physics_process(delta):
	if once && !twice:
		get_tree().call_group("units", "_game_loaded");
		twice = true
	
	if !once:
		once = true;
	pass
	
func change_map():
	once = false;
	twice = false;
	exit_map()
	current_board = board_2.instance()
	add_child(current_board)
	pass
	
func exit_map():
	current_board.call_deferred("queue_free")
	
func open_board(board : Board):
	once = false
	twice = false;
	current_board = board_1.instance()
	current_board.set_name("Board")
	add_child(current_board)
	board_UI = board_UI_prefab.instance()
	add_child(board_UI)
	pass
	
func close_board():
	current_board.call_deferred("queue_free")
	board_UI.queue_free()
	pass
	
