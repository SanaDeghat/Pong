extends CharacterBody2D
@export var START_SPEED: float = 500.0
@export var MAX_SPEED: float = 1200.0
@export var SPEED_ACCEL: float = 40.0
@export var MAX_Y_ANGLE: float = 0.8 
@onready var ball_impact_paticles: CPUParticles2D = $impact_particle

var current_speed: float = START_SPEED
var direction: Vector2 = Vector2.ZERO
@onready var tail_particle: CPUParticles2D = $tail_particle

signal score(location: int)

func _ready() -> void:
	randomize()
	reset(-1) 
	
func _physics_process(delta: float) -> void:
	velocity = direction * current_speed
	move_and_slide()
	
	if global_position.x > 1100 or global_position.x < -200:
		reset(global_position.x)
	
	if global_position.y > 330 and direction.y > 0:
		direction.y *= -1
		add_tini_spin()
	elif global_position.y < -330 and direction.y < 0:
		direction.y *= -1
		add_tini_spin()

func reset(location: float) -> void:
	global_position = Vector2(450, 0)
	current_speed = START_SPEED
	tail_particle.lifetime=0.2
	var dir_x = 1 if location < 0 else -1
	var dir_y = randf_range(-0.4, 0.4) 
	ball_impact_paticles.lifetime = 0.7
	direction = Vector2(dir_x, dir_y).normalized()
	score.emit(int(location))
	ball_impact_paticles.direction.x = direction.x*-1


func _on_area_2d_body_entered(body: Node2D) -> void:
	var ho = global_position.y - body.global_position.y
	var ni = ho / 50.0 
	ni = clamp(ni, -MAX_Y_ANGLE, MAX_Y_ANGLE)
	particle()

	direction.x *= -1
	direction.y = ni
	add_tini_spin()
	direction = direction.normalized() 
	tail_particle.lifetime+=0.01
	current_speed = min(current_speed + SPEED_ACCEL, MAX_SPEED)

func add_tini_spin():
	direction.y += randf_range(-0.05, 0.05)
	direction = direction.normalized()

func particle():
	ball_impact_paticles.emitting = true
	ball_impact_paticles.direction = direction
