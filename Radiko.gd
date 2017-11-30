extends Node2D

onready var Kamero = get_node("Kamero")
onready var K = get_node("K")

func _ready():
	T.Radiko = self
	set_process(true)

func _process(delta):
	Kamero.set_offset(K.get_global_pos())

func _on_Ondo_body_enter( korpo ):
	korpo.Morti()

func _je_eniri(s_idx):
	var idx = int(s_idx.substr(2, 10))
	if has_node("Areoj/"+s_idx+"/Bontegoloj"):
		var Bontegoloj = get_node("Areoj/"+s_idx+"/Bontegoloj").get_children()
		var t = 0.1
		for Bontegolo in Bontegoloj:
			Bontegolo.Tempilo.set_wait_time(t)
			Bontegolo.Tempilo.start()
			t += 0.1