extends Node

enum Times { PAST, PRESENT }
enum Age { KID, ADULT }

signal time_changed(new_value) # 0 or 1
signal age_changed(new_value) # 0 or 1
signal tempo_changed(new_value) # {-1, 1}
signal button_pressed(button_id)
signal button_unpressed(button_id)

signal block_break
signal victory
signal restart
signal fall
signal coin_collected
