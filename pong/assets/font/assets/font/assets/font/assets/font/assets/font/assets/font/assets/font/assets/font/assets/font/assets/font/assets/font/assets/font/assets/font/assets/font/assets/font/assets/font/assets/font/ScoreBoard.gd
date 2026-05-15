extends Label
var score =0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text=str(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	text = str(get_parent().blueScore);
