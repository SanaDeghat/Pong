extends CharacterBody2D


const SPEED = 400.0
var dir = 1

func _physics_process(delta: float) -> void:




	velocity.x = dir* SPEED

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	dir*=-1
