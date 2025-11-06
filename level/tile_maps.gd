extends Node

func _ready() -> void:
	Events.connect("time_changed", _on_changed)
	
func _on_changed(new_time) -> void:
	if new_time == Events.Times.PAST:
		$TileMapPast.show()
		$TileMapPresent.hide()
	else:
		$TileMapPast.hide()
		$TileMapPresent.show()
