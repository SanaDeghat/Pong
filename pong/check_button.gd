extends CheckButton
@onready var button_press_sound_effect: AudioStreamPlayer2D = $"../../../../../button_press_sound_effect"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_pressed=!Global.keyboard;
	


func _on_pressed() -> void:
	button_press_sound_effect.play()
	Global.keyboard= !Global.keyboard
