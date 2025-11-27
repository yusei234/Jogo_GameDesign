extends Node

var time = Events.Times.PAST

@onready var audio_melting = $AudioMelting
@onready var audio_elec = $AudioElec
@onready var audio_birds: AudioStreamPlayer = $AudioBirds
@onready var audio_car: AudioStreamPlayer = $AudioCar

@onready var timer_birds: Timer = $TimerBirds

func _ready() -> void:
	Events.connect("block_break", func(): audio_melting.play())
	@warning_ignore("unused_parameter")
	Events.connect("button_pressed", func(id): audio_elec.play())
	Events.connect("time_changed", _on_time_changed)
	
	# SETUP RANDOM BIRD NOISES
	audio_birds.set_volume_db(-12)
	timer_birds.wait_time = randf_range(3, 6)
	timer_birds.start()

	# SETUP RANDOM BIRD NOISES
	audio_birds.set_volume_db(-12)
	timer_birds.wait_time = randf_range(3, 6)
	timer_birds.start()

# ---------- LOOPS
var last_birds: int = 0

func _on_timer_birds_timeout() -> void:
	var new_birds = randi_range(1, 4)
	while new_birds == last_birds:
		new_birds = randi_range(1, 4)
	audio_birds.set_stream(load("res://sfx/birds_" + str(new_birds) + ".mp3"))
	audio_birds.play()
	
	timer_birds.wait_time = randf_range(2, 4)
	
func _on_time_changed(new_value) -> void:
	if new_value == Events.Times.PRESENT:
		audio_car.play()
