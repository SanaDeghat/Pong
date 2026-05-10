extends Node2D

signal choosePlayerAmount()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	choosePlayerAmount.emit()
	


func _on_one_player_pressed() -> void:
	Global.playerNum=1;
	get_tree().change_scene_to_file("res://main_page.tscn")


func _on_two_player_pressed() -> void:
	Global.playerNum=2
	get_tree().change_scene_to_file("res://main_page.tscn")
