extends KinematicBody2D

export (int) var jump_speed = 600
export (int) var gravity = -1800

var velocity = Vector2.ZERO
var angle = 0
var enable_jump = true
var enable_motion = true
var original_position
var jump_timer 

func _ready():
	original_position = position
	jump_timer = get_node("jump_timer")

	start_am()
	#stop_am()

	
func start_am():
	position = original_position
	angle = 0
	enable_jump = true
	enable_motion = true
	velocity = Vector2.ZERO
	jump_speed = 600
	gravity = -1800
	jump_timer.start()


func stop_am():
	jump_timer.stop()
	enable_motion = false	
		

func _physics_process(delta):
	if enable_motion:
		angle = -(velocity.x / 10)

		if angle > 45:
			angle = 45
		if angle < -45:
			angle = -45
	
		rotation = deg2rad(angle)
		velocity.x += gravity * delta
		move_and_slide(velocity) 

	if enable_jump:
		velocity.x = jump_speed
		enable_jump = false
		
	if(position.x < 500):
		enable_jump = true
		jump_timer.start()

	if(position.x > original_position.x):
		jump_timer.stop()


func _on_jump_timer_timeout():
	enable_jump = true
