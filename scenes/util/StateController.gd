extends Node

const MAIN_MENU = 0
signal open_main_menu
signal close_main_menu

const SHOP = 1
signal open_shop
signal close_shop

const BOARD = 2
signal open_board
signal close_board

var state

func _ready():
	state = MAIN_MENU

func request_shop_open():
	if state == MAIN_MENU:
		emit_signal("close_main_menu")
		emit_signal("open_shop")
		state = SHOP
	pass
	
# Note main menu doesn't have a close option as it is only closed 
# by navigating away from it somehow.
func request_main_menu_open():
	if state == BOARD:
		emit_signal("close_board")
		emit_signal("open_main_menu")
		state = MAIN_MENU
		pass
		
	if state == SHOP:
		emit_signal("close_shop")
		emit_signal("open_main_menu")
		state = MAIN_MENU
		pass
	pass
	
# Board cant be closed it can only attempt to navigate to the menu.
func request_board_open(board : Board):
	
	if state == MAIN_MENU:
		emit_signal("close_main_menu")
		emit_signal("open_board", board)
		state = BOARD
		pass
	pass
	
