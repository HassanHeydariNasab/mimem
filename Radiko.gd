extends Node2D

onready var Kamero = get_node("Kamero")

func _ready():
	T.Radiko = self
	set_process(true)

func _process(delta):
	pass

func _on_Ondo_body_enter( korpo ):
	korpo.Morti()
