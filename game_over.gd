extends Node2D

onready var game_over = get_node("go_sign")
onready var go_tween = get_node("go_sign/go_sign_tween")
onready var score_label = get_node("go_sign/score")

func _ready():
	pass
	# mostrar(100)
	

func mostrar(score):
	score_label.set_text(str(score))
	
	go_tween.interpolate_property(game_over, "position",
			Vector2(1540, 384), Vector2(828, 384), 1,
			Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	go_tween.start()

func ocultar():
	go_tween.interpolate_property(game_over, "position",
			Vector2(828, 384), Vector2(1540, 384), 1,
			Tween.TRANS_EXPO , Tween.EASE_OUT)
	go_tween.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
