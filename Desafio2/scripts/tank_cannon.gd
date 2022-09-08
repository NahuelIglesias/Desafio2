extends Sprite

onready var shootPosition:Position2D = $shoot_position
var mousePosition = get_global_mouse_position()

export (PackedScene) var bullet_scene:PackedScene

var bullet_container:Node 
#var bullet_scene:PackedScene = preload("res://scenes/player_bullet.tscn")

func _ready():
	pass

func _process(delta):
	mousePosition = get_global_mouse_position()
	look_at(mousePosition)
	
	if Input.is_action_just_pressed("shoot_cannon"):
		shoot()
		
func shoot():
	var bullet_instance:bullet = bullet_scene.instance()
	bullet_container.add_child(bullet_instance)
	bullet_instance.set_starting_values(shootPosition.global_position, (shootPosition.global_position - global_position).normalized())
	bullet_instance.connect("delete_requested", self, "on_bullet_delete_requested")
	
func on_bullet_delete_requested(bullet):
	bullet_container.remove_child(bullet)
	bullet.queue_free()
