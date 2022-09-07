extends Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(375,305)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("mover_izq")):
		position.x += -10
	if (Input.is_action_pressed("mover_der")):
		position.x += 10
