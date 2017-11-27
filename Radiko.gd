extends Node2D

onready var Kamero = get_node("Kamero")
onready var Ondo = get_node("/root/Radiko/Ondo")
onready var Ondo_Animo = get_node("/root/Radiko/Ondo/Animo")
onready var Ondo_Aspekto = get_node("/root/Radiko/Ondo/Aspekto")

func _ready():
	T.Radiko = self
	set_process(true)

func _process(delta):
	Ondo.set_global_pos(T.K.get_global_pos())

func _on_Ondo_body_enter( korpo ):
	korpo.Morti()

func _on_Animo_tween_complete( object, key ):
	Ondo_Animo.stop_all()
	Ondo_Aspekto.hide()
	Ondo.set_scale(Vector2(0.1,0.1))
