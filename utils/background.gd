extends Node2D

var fade_timer = 0
var fade_in_node
var fade_out_node
var current_time = Events.Times.PAST

func _ready() -> void:
	Events.connect("time_changed", _on_time_changed)
	$Cidade.modulate.a = 0
	
func _process(delta: float) -> void:
	if fade_timer != 0 :
		fade_timer = max(0, fade_timer-delta)
		fade_in_node.modulate.a = 1-fade_timer
		fade_out_node.modulate.a = fade_timer
	
func _on_time_changed(new_time) -> void:
	current_time = new_time
	fade_timer = 1
	if fade_out_node != null :
		fade_out_node.modulate.a = 0
	fade_out_node = fade_in_node
	if fade_out_node == null :
		fade_out_node = $Campo
	match new_time :
		Events.Times.PRESENT :
			fade_in_node = $Cidade
		Events.Times.PAST :
			fade_in_node = $Campo
