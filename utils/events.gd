extends Node

enum Times { PAST, PRESENT }
enum Age { KID, ADULT }

signal time_changed(new_value) # 0 or 1
signal age_changed(new_value) # 0 or 1

signal block_break
