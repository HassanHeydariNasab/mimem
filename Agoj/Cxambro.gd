extends Area2D

onready var Kamero = get_node("/root/Radiko/Kamero")
onready var Formo = get_node("Formo")

func _ready():
	pass

func _on_Cx0_body_enter( korpo ):
	Kamero.set_offset(Formo.get_global_pos())
