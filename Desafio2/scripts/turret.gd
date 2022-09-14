extends Sprite

export (PackedScene) var bullet_scene:PackedScene
onready var shoot_position:Position2D = $ShootPosition
var bullet_container:Node

var tank_player

func set_values(tank_player, bullet_container):
	self.tank_player = tank_player
	self.bullet_container = bullet_container
	$Timer.start()

func _on_Timer_timeout():
	shoot()

func shoot():
	var bullet:bullet = bullet_scene.instance()
	bullet_container.add_child(bullet)
	bullet.set_starting_values(shoot_position.global_position, (tank_player.global_position - shoot_position.global_position).normalized())
	bullet.connect("delete_requested", self, "_on_bullet_delete_requested")

func _on_bullet_delete_requested(bullet):
	bullet_container.remove_child(bullet)
	bullet.queue_free()
