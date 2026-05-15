extends Node2D

@onready var pause_menu: MarginContainer = $pause_menu
@onready var settings_menu: MarginContainer = $settings_menu
@onready var node_2d: Node2D = $"."
@onready var button_press_sound_effect: AudioStreamPlayer2D = $sounds/button_press_sound_effect

var blueScore = 0
var orangeScore = 0


func _process(delta: float) -> void:
	pass



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
	get_tree().change_scene_to_file("res://starter_menu.tscn")


func playButtonSoundEffect() -> void:
	button_press_sound_effect.playing=true
