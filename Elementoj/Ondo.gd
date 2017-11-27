extends Area2D

onready var Kasxi = get_node("Kasxi")

func _ready():
	pass

func _on_Vivo_body_enter( korpo ):
	clear_shapes()
	korpo.Aldoni_ondon(1)
	Kasxi.interpolate_property(self, "transform/scale", Vector2(1,1),
		Vector2(2,2),0.3,Tween.TRANS_QUAD,Tween.EASE_OUT)
	Kasxi.interpolate_property(self, "visibility/opacity", 1,
		0,0.3,Tween.TRANS_QUAD,Tween.EASE_OUT)
	Kasxi.start()

func _on_Kasxi_tween_complete( object, key ):
	queue_free()
