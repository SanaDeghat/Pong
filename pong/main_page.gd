extends Node2D
@onready var pause_menu: MarginContainer = $pause_menu

var blueScore=0; 
var orangeScore=0; 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if Input.is_action_just_pressed("pause_action"):
		if pause_menu.visible==false:
			print("on")
			pause_menu.visible=true;
			get_tree().paused = true
		else:
			print("off")
			pause_menu.visible=false;
			get_tree().paused = false



func _ball_score(score: int) -> void:
	if score>0:
		blueScore+=1; 
	else: 
		orangeScore+=1;


func _on_restart_btn_pressed() -> void:
	pause_menu.visible=false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_page.tscn")


func _on_quit_btn_pressed() -> void:
	pause_menu.visible=false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://starter_menu.tscn")
