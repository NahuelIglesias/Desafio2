extends Sprite

var mousePosition = get_global_mouse_position()

func _ready():
	pass

func _process(delta):
	mousePosition = get_global_mouse_position()
	look_at(mousePosition)
