extends KinematicBody2D

onready var Aspekto = get_node("Aspekto")

const VIVO = 4.0
var vivo = 4.0

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("supre"):
		if not Aspekto.is_playing():
			Aspekto.set_frame(0)
			Aspekto.play()
		if Aspekto.get_animation() != "supre":
			Aspekto.set_animation("supre")
		move(Vector2(0,-2))
	elif Input.is_action_pressed("malsupre"):
		if not Aspekto.is_playing():
			Aspekto.set_frame(0)
			Aspekto.play()
		if Aspekto.get_animation() != "malsupre":
			Aspekto.set_animation("malsupre")
		move(Vector2(0,2))
	elif Input.is_action_pressed("dekstre"):
		if not Aspekto.is_playing():
			Aspekto.set_frame(0)
			Aspekto.play()
		if Aspekto.get_animation() != "dekstre":
			Aspekto.set_animation("dekstre")
		move(Vector2(2,0))
	elif Input.is_action_pressed("maldekstre"):
		if not Aspekto.is_playing():
			Aspekto.set_frame(0)
			Aspekto.play()
		if Aspekto.get_animation() != "maldekstre":
			Aspekto.set_animation("maldekstre")
		move(Vector2(-2,0))
	else:
		Aspekto.set_frame(1)
		Aspekto.stop()

func Malsanigxi(potenco):
	vivo -= potenco
	if vivo <= 0:
		get_tree().reload_current_scene()
	set_opacity(vivo/VIVO)

func Sanigxi(potenco):
	vivo += potenco
	if vivo > VIVO:
		vivo = VIVO
	set_opacity(vivo/VIVO)
