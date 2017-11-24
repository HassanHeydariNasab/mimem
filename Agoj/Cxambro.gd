extends Area2D

onready var Kamero = get_node("/root/Radiko/Kamero")

func _ready():
	pass

func _on_Cx0_body_enter( korpo ):
	Kamero.set_global_pos(get_global_pos())
