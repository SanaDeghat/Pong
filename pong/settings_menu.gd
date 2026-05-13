extends MarginContainer

@export var offscreen_x: float = 2160.0
@export var animation_duration: float = 0.4
@onready var pause_menu: MarginContainer = $"../pause_menu"

func _ready() -> void:
	position.x = offscreen_x
	visible = false

func show_menu() -> void:
	visible = true
	var tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position:x", 0.0, animation_duration*2)

func hide_menu_hor() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "position:x", offscreen_x, animation_duration)
	tween.finished.connect(func(): visible = false)

func _on_back_btn_pressed() -> void:
	hide_menu_hor()             
	pause_menu.show_menu_hor()  

func _on_settingsbtn_pressed() -> void:
	show_menu()
