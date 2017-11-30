extends Area2D

onready var Formo = get_node("Formo")

signal eniri

func _ready():
	self.connect("body_enter", self, "_je_Cxambro_korpo_eniri")

func _je_Cxambro_korpo_eniri( korpo ):
	if not self.is_connected("eniri", T.Radiko, "_je_eniri"):
		self.connect("eniri", T.Radiko, "_je_eniri")
	emit_signal("eniri", get_name(), Formo.get_global_pos())
