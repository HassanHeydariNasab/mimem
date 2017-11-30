extends Area2D

onready var Aperi = get_node("Aperi")
onready var Malaperi = get_node("Malaperi")
onready var Tempilo = get_node("Tempilo")

func _ready():
	Aperi.interpolate_property(self, "visibility/opacity",
		0, 1, 0.3, Tween.TRANS_QUAD, Tween.EASE_IN)
	Malaperi.interpolate_property(self, "visibility/opacity",
		1, 0, 0.5, Tween.TRANS_QUAD, Tween.EASE_IN, 0.3)

func _on_Tempilo_timeout():
	Aperi.start()
	Malaperi.start()
