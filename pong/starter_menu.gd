extends Node2D
@onready var button_press_sound_effect: AudioStreamPlayer2D = $button_press_sound_effect

signal choosePlayerAmount()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _ready () -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Global.audio)

func _on_start_pressed() -> void:
	choosePlayerAmount.emit()
	


func _on_one_player_pressed() -> void:
	Global.playerNum=1;
	get_tree().change_scene_to_file("res://main_page.tscn")


func _on_two_player_pressed() -> void:
	Global.playerNum=2
	get_tree().change_scene_to_file("res://main_page.tscn")


func _on_h_slider_2_value_changed(value: float) -> void:
	print(value)
	Global.audio= value
	if value==-28:
		Global.audio= -100
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Global.audio)
