extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_pressed=!Global.keyboard;
	


func _on_pressed() -> void:
	Global.keyboard= !Global.keyboard
	print(Global.keyboard)
