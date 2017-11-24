extends KinematicBody2D

#onready var K = get_node("/root/Radiko/K")
onready var Tempilo = get_node("Tempilo")
onready var Mortigxi = get_node("Mortigxi")

const RAPIDO = 6
const TESTA_RAPIDO = 50
var stato = 0
const CELADO = 0
const PAFADO = 1

func _ready():
	randomize()
	rotate(rand_range(0,2*PI))
	set_process(true)

func _process(delta):
	if stato == PAFADO:
		move(Vector2(RAPIDO*cos(get_rot()), -RAPIDO*sin(get_rot())))
		if is_colliding():
			var kolizianto = get_collider()
			var nomo = get_collider().get_name()
			if nomo == "K":
				clear_shapes()
				kolizianto.Malsanigxi(1)
				Mortigxi.interpolate_property(self, "transform/scale", Vector2(1,1),
					Vector2(1.8,1.8),0.2,Tween.TRANS_BOUNCE,Tween.EASE_IN)
				Mortigxi.interpolate_property(self, "visibility/opacity", 1,
					0,0.2,Tween.TRANS_BOUNCE,Tween.EASE_IN)
				Mortigxi.start()
				set_process(false)
			else:
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
