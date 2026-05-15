extends MarginContainer

@export var offscreen_y: float = 800.0 
@export var offscreen_x: float = -1080.0
@export var animation_duration: float = 0.4
@onready var settings_menu: MarginContainer = $"../settings_menu"

func _ready() -> void:
	position.y = offscreen_y
	visible = false

func _process(delta: float) -> void:
	pass

func show_menu() -> void:
	visible = true
	get_tree().paused = true
	
	var tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position:y", 0.0, animation_duration)

func hide_menu() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "position:y", offscreen_y, animation_duration)
	
	tween.finished.connect(_on_hide_animation_finished)

func show_menu_hor() -> void:
	visible = true
	var tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position:x", 0.0, 0.8)

func hide_menu_hor() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "position:x", offscreen_x, animation_duration)
	tween.finished.connect(func(): visible = false)

func _on_hide_animation_finished() -> void:
	visible = false
	get_tree().paused = false

func _on_resume_btn_pressed() -> void:
	get_parent().playButtonSoundEffect()
	hide_menu()

func _on_settingsbtn_pressed() -> void:
	get_parent().playButtonSoundEffect()
	hide_menu_hor()
func _input(event):
	if Input.is_action_just_pressed("pause_action"):
		if settings_menu.visible == true:
			print("Returning from Settings to Pause")
			settings_menu.hide_menu_hor()
			show_menu_hor()
		elif visible == false:
			print("Paused")
			show_menu() 
		else:
			print("Resumed")
			hide_menu()
