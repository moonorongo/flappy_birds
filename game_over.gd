extends Node2D

onready var game_over = get_node("go_sign")
onready var go_tween = get_node("go_sign/go_sign_tween")
onready var score_label = get_node("go_sign/score")
onready var timer_gameover = get_node("timer_gameover")
var videos
var on_screen  = false

func _ready():
	videos = get_tree().get_root().get_node("Game/CanvasFloor/Videos")
	

func mostrar(score):
	score_label.set_text(str(score))
	
	go_tween.interpolate_property(game_over, "position",
			Vector2(1540, 384), Vector2(828, 384), .5,
			Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	go_tween.start()
	on_screen = true
	timer_gameover.start()
	

func ocultar():
	go_tween.interpolate_property(game_over, "position",
			Vector2(828, 384), Vector2(1540, 384), .5,
			Tween.TRANS_EXPO , Tween.EASE_OUT)
	go_tween.start()
	on_screen = false


func _on_timer_gameover_timeout():
	ocultar()
	videos.show_videos()
	# mostrar videos
