extends KinematicBody2D

onready var Aspekto = get_node("Aspekto")
onready var Ondo = get_node("Ondo")
onready var Ondo_Animo = get_node("Ondo/Animo")
onready var Ondo_Aspekto = get_node("Ondo/Aspekto")
onready var Ondoj = get_node("/root/Radiko/Kanvaso/Ondoj")

const VIVO = 4.0
var vivo = 4.0
var ondoj = 5

func _ready():
	T.K = self
	Ondo_Animo.interpolate_property(
		Ondo, "transform/scale",Vector2(0.1,0.1),
		Vector2(1,1),0.3,Tween.TRANS_QUAD, Tween.EASE_OUT
		)
	Ondo.set_scale(Vector2(0.1,0.1))
	set_process(true)
	set_process_input(true)

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

func _input(evento):
	if evento.is_action_pressed("ondi"):
		if ondoj >= 1:
			ondoj -= 1
			Ondoj.set_text(str(ondoj))
			Ondo_Animo.resume_all()
			Ondo_Aspekto.show()

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

func Aldoni_ondon(valoro):
	ondoj += valoro
	Ondoj.set_text(str(ondoj))

func _on_Ondo_body_enter( korpo ):
	korpo.Morti()

func _on_Animo_tween_complete( object, key ):
	Ondo_Animo.stop_all()
	Ondo_Aspekto.hide()
	Ondo.set_scale(Vector2(0.1,0.1))
