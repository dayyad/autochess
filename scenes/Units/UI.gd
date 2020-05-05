extends Node2D

var original_width;

# Called when the node enters the scene tree for the first time.
func _ready():
	original_width = $HealthForeground.rect_size.x
	pass # Replace with function body.

func _process(delta):
	var ratio =  owner.health / owner.max_health 
	$HealthForeground.rect_size.x = ratio * original_width
	pass
