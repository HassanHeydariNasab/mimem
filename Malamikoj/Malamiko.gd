extends KinematicBody2D

onready var Tempilo = get_node("Tempilo")
onready var Aspekto = get_node("Aspekto")
onready var Mortigxi = get_node("Mortigxi")
onready var Aperi = get_node("Aperi")
onready var Partiklo = get_node("Partiklo")
onready var Aspekto_amiko = preload("res://Malamikoj/amiko.png")

const RAPIDO = 3
const TESTA_RAPIDO = 50
var stato = 0
const CELADO = 0
const PAFADO = 1

var cxu_amiko = false

func _ready():
	if get_parent().get_name() == "Amikoj":
		cxu_amiko = true
		Aspekto.set_texture(Aspekto_amiko)
		Partiklo.set_color("00ff00")
	randomize()
	rotate(rand_range(0,2*PI))
	set_scale(Vector2(0,0))
	Aperi.interpolate_property(self, "transform/scale", Vector2(0.1,0.1),
		Vector2(1,1),0.5,Tween.TRANS_BOUNCE,Tween.EASE_IN,3)
	Aperi.start()

func Morti():
	clear_shapes()
	Mortigxi.interpolate_property(self, "transform/scale", Vector2(1,1),
		Vector2(1.8,1.8),0.2,Tween.TRANS_BOUNCE,Tween.EASE_IN)
	Mortigxi.interpolate_property(self, "visibility/opacity", 1,
		0,0.2,Tween.TRANS_BOUNCE,Tween.EASE_IN)
	Mortigxi.start()
	set_process(false)

func _process(delta):
	if stato == PAFADO:
		move(Vector2(RAPIDO*cos(get_rot()), -RAPIDO*sin(get_rot())))
		if is_colliding():
			var kolizianto_nomo = get_collider().get_name()
			if kolizianto_nomo == "K":
				T.K.Malsanigxi(1)
				Morti()
			elif kolizianto_nomo == "Ondo":
				Morti()
			elif kolizianto_nomo == "Muro":
				Tempilo.start()
				stato = CELADO
				randomize()
				var testa_angulo = rand_range(0,2*PI)
				while test_move(Vector2(TESTA_RAPIDO*cos(testa_angulo), -TESTA_RAPIDO*sin(testa_angulo))):
					randomize()
					testa_angulo = rand_range(0,2*PI)
				set_rot(testa_angulo)

func _on_Tempilo_timeout():
	stato = PAFADO

func _on_Mortigxi_tween_complete( object, key ):
	queue_free()

func _on_Aperi_tween_complete( object, key ):
	Partiklo.set_emitting(true)
	Tempilo.start()
	set_process(true)