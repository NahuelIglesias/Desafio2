extends Node2D

func _ready():
	$tank_player.set_bullet_container(self)
	$turret.set_tank_player()
