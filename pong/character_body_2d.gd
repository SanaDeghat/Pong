extends CharacterBody2D


const SPEED = 700.0


func _physics_process(delta: float) -> void:
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Global.keyboard:
		print("keyboard")
		var direction := Input.get_axis("ui_up", "ui_down")
		if direction :
			
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		position.y=get_global_mouse_position().y-300
		

	move_and_slide()
	position.y = clamp(position.y, -230, 235)
