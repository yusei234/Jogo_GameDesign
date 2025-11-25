extends Node

func _ready() -> void:
	Events.connect("time_changed", _on_changed)
	
func _on_changed(new_time) -> void:
	if new_time == Events.Times.PAST:
		$TileMapPast.show()
		$TileMapPresent.hide()
		$TileMapPast.enabled = true
		await get_tree().create_timer(0.1).timeout
		$TileMapPresent.enabled = false
		
	elif (new_time == Events.Times.PRESENT):
		$TileMapPast.hide()
		$TileMapPresent.show()
		$TileMapPresent.enabled = true
		await get_tree().create_timer(0.1).timeout
		$TileMapPast.enabled = false
