extends CharacterBody2D

@onready var ball: CharacterBody2D = $"../Ball"

const SPEED = 700.0

const AI_MAX_SPEED = 550.0 
const AI_ACCEL = 3500.0    
func _physics_process(delta: float) -> void:
	if Global.playerNum == 2:
		var direction := Input.get_axis("p2_up", "p2_down")
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		var distance_to_ball = ball.position.y - position.y
		var target_velocity = clamp(distance_to_ball * 15.0, -AI_MAX_SPEED, AI_MAX_SPEED)
		velocity.y = move_toward(velocity.y, target_velocity, AI_ACCEL * delta)

	move_and_slide()
	position.y = clamp(position.y, -230, 235)
