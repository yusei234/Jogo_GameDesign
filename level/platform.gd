extends Node2D

@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D
@export var speed = 100
var actSpeed = 0

@export var target_id: int = 0

func _ready():
	actSpeed = 0
	path_follow.progress = 0
	Events.connect("button_pressed", _on_button_press)
	Events.connect("button_unpressed", _on_button_unpress)

	
func _on_button_press(id: int) -> void:
	if id == target_id :
		actSpeed = speed
		
func _on_button_unpress(id: int) -> void:
	if id == target_id :
		actSpeed = -speed


func _process(delta: float) -> void:
	path_follow.progress += actSpeed * delta
 
