extends Node2D

var blueScore=0; 
var orangeScore=0; 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _ball_score(score: int) -> void:
	if score>0:
		
		blueScore+=1; 
		
	else: 
		orangeScore+=1;
