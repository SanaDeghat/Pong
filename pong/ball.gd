extends CharacterBody2D


var SPEED = 400.0
var dirx = 1
var diry = 1
signal score( score :int )
func _physics_process(delta: float) -> void:
	velocity.x = dirx* SPEED
	move_and_slide()
	if position.x>1100 ||position.x<-200:
		reset( position.x) 
	if position.y>330 ||position.y<-330:
		velocity.y*=-1
	
func reset( location :int) : 
	if (location<0):
		dirx = 1
	else:
		dirx = -1
	position.x=450
	position.y=0
	velocity.y=0
	score.emit(location)
func _on_area_2d_body_entered(body: Node2D) -> void:
	dirx*=-1
	SPEED +=5
	velocity.y= diry* body.position.y
	
