extends KinematicBody2D

export (int) var jump_speed = 600
export (int) var gravity = -1800

var game_over_sign 

var velocity = Vector2.ZERO
var angle = 0
var enable_jump = true
var enable_motion = true
var collision
var original_position
var timer
var game
var videos
var banners

func _ready():
	game_over_sign = get_tree().get_root().get_node("Game/GameOver")
	videos = get_tree().get_root().get_node("Game/CanvasFloor/Videos")
	game = get_tree().get_root().get_node("Game")
	banners = get_tree().get_root().get_node("Game/CanvasFloor/banners")
	original_position = Vector2(900, 370)
	timer = get_parent().get_node("Timer")
	#timer.stop()

	
func reset_game():
	videos.hide_videos()
	banners.start()
	game.reset_score()
	velocity = Vector2.ZERO
	angle = 0
	position = original_position
	enable_jump = true
	enable_motion = true
	jump_speed = 600
	gravity = -1800
	timer.start()
	
		

func _physics_process(delta):
	angle = -(velocity.x / 10)
#
	if angle > 45:
		angle = 45
	if angle < -45:
		angle = -45

	rotation = deg2rad(angle)
	velocity.x += gravity * delta
	
	if(enable_motion):
		move_and_slide(velocity) 
		if(get_slide_count() > 0): ## > 0 = has collide
			enable_jump = false
		

	if enable_jump:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.x = jump_speed
	else:
		if(not enable_motion):
			if Input.is_action_just_pressed("ui_accept") and not game_over_sign.on_screen:
				reset_game()
				#game_over_sign.ocultar()
		
	if(position.x < 0 and enable_motion):
		#print("muertoooo")
		enable_jump = false
		enable_motion = false
		timer.stop()
		game_over_sign.mostrar(game.score)

	if(position.x > 1400 or position.x < 344):
		enable_jump = false
