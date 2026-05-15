extends Node2D
@onready var button_press_sound_effect: AudioStreamPlayer2D = $button_press_sound_effect

signal choosePlayerAmount()
@onready var pixilart_drawing: Sprite2D = $PixilartDrawing


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _ready () -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Global.audio)
	if Global.GameStarted:
		pixilart_drawing.position.y=580.8
		pixilart_drawing.hide_curtin()
		await pixilart_drawing.cutin_finished

	


func _on_one_player_pressed() -> void:
	Global.playerNum=1;
	pixilart_drawing.show_cutin()
	Global.GameStarted=true
	await pixilart_drawing.cutin_finished
	get_tree().change_scene_to_file("res://main_page.tscn")


func _on_two_player_pressed() -> void:
	Global.playerNum=2
	
	pixilart_drawing.show_cutin()
	Global.GameStarted=true
	await pixilart_drawing.cutin_finished
	get_tree().change_scene_to_file("res://main_page.tscn")


func _on_h_slider_2_value_changed(value: float) -> void:
	print(value)
	Global.audio= value
	if value==-28:
		Global.audio= -100
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Global.audio)


func _on_exit_btn_pressed() -> void:
	get_tree().quit()
