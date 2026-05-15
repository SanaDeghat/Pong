extends MarginContainer
@export var offscreen_x: float = -2160.0
@export var animation_duration: float = 0.4
@onready var button_press_sound_effect: AudioStreamPlayer2D = $"../button_press_sound_effect"

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_settingsbtn_pressed() -> void:
	button_press_sound_effect.play()
	hide_menu_hor()
	
	
func show_menu_hor() -> void:
	visible = true
	var tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position:x", 0.0, 0.8)

func hide_menu_hor() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "position:x", offscreen_x, animation_duration)
	tween.finished.connect(func(): visible = false)


func _on_check_button_pressed() -> void:
	button_press_sound_effect.play()
