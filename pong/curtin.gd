extends Sprite2D

signal cutin_finished # Signal to notify when the animation is done

var done = false
var target_y = 156.0
var end_y=-580.0
@export var animation_duration: float = 0.4

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass


func show_cutin() -> void:
	done=false
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position:y", target_y, animation_duration)
	
	tween.finished.connect(func(): 
		done = true
		cutin_finished.emit()
	)
	
func hide_curtin() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position:y", end_y, animation_duration*2)
	tween.finished.connect(func(): 
		done = true
		cutin_finished.emit()
	)
