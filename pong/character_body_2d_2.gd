extends CharacterBody2D

@onready var ball: CharacterBody2D = $"../Ball"

const SPEED = 700.0


func _physics_process(delta: float) -> void:
		# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Global.playerNum==2:
		var direction := Input.get_axis("p2_up", "p2_down")
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		position.y=ball.position.y

	move_and_slide()
	position.y = clamp(position.y, -230, 235)
