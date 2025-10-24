extends Node2D
#@onready var menu_select = preload("res://menu/Victory.tscn")

@export var level_id: int = 0

var time: float = 0
const period: float = 3.0 

func _process(delta: float) -> void:
	time += delta
	if time > period :
		time -= period
		
	$Sprite2D.position.y = 5*sin(time*2*PI/period)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	Events.emit_signal("victory")
