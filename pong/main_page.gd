extends Node2D

@onready var pause_menu: MarginContainer = $pause_menu
@onready var settings_menu: MarginContainer = $settings_menu
@onready var node_2d: Node2D = $"."
@onready var button_press_sound_effect: AudioStreamPlayer2D = $sounds/button_press_sound_effect
@onready var h_slider_2: HSlider = $settings_menu/settings_menu_pic/Sprite2D/HSlider2

# NEW: Add a reference to your cutin Sprite2D node 
# (Make sure to update "CutinSprite" to the actual name/path of your node in the scene tree)
@onready var cutin_sprite: Sprite2D = $PixilartDrawing

var blueScore = 0
var orangeScore = 0

func _process(delta: float) -> void:
	pass

func _ready () -> void:
	cutin_sprite.hide_curtin()
	h_slider_2.value=AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	await cutin_sprite.cutin_finished


func _ball_score(score: int) -> void:
	if score > 0:
		blueScore += 1 
	else: 
		orangeScore += 1

func _on_restart_btn_pressed() -> void:
	playButtonSoundEffect()
	pause_menu.visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_page.tscn")

func _on_quit_btn_pressed() -> void:
	playButtonSoundEffect()
	pause_menu.visible = false
	
	get_tree().paused = false
	
	cutin_sprite.show_cutin()
	
	await cutin_sprite.cutin_finished
	get_tree().change_scene_to_file("res://starter_menu.tscn")

func playButtonSoundEffect() -> void:
	button_press_sound_effect.play()

func _on_h_slider_2_value_changed(value: float) -> void:
	print(value)
	Global.audio = value
	if value == -28:
		Global.audio = -100
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Global.audio)

func _on_back_to_pause_pressed() -> void:
	pass # Replace with function body.

func _on_check_button_pressed() -> void:
	playButtonSoundEffect()
