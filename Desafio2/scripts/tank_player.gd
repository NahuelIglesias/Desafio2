extends Sprite

onready var tankCannon = $tank_cannon

var bullet_container:Node

func _ready():
	position = Vector2(375,305)

func _process(delta):
	if (Input.is_action_pressed("mover_izq")):
		position.x += -10
	if (Input.is_action_pressed("mover_der")):
		position.x += 10

func set_bullet_container(container):
	tankCannon.bullet_container = container
	bullet_container = container
