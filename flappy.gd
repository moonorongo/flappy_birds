extends KinematicBody2D

export (int) var jump_speed = -600
export (int) var gravity = 1800

var velocity = Vector2.ZERO
var angle = 0
var enable_jump = true
var enable_motion = true
var collision
var original_position


func _ready():
	original_position = position

	
func reset_game():
	velocity = Vector2.ZERO
	angle = 0
	position = original_position
	enable_jump = true
	enable_motion = true
	jump_speed = -600
	gravity = 1800
	
		

func _physics_process(delta):
	angle = (velocity.y / 10)
#
	if angle > 45:
		angle = 45
	if angle < -45:
		angle = -45

	rotation = deg2rad(angle)
	
	if(enable_motion):
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity) 
		if(get_slide_count() > 0): ## > 0 = has collide
			enable_jump = false
		
# move_and_collide example		
#		velocity.y += gravity * delta
#		collision = move_and_collide(velocity * delta) 
#		if(collision):
#			enable_jump = false

# move_and_slide collision example
#	for i in get_slide_count():
#	    var collision = get_slide_collision(i)
#	    print("I collided with ", collision.collider.name)


	if enable_jump:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_speed
	else:
		if(not enable_motion):
			if Input.is_action_just_pressed("ui_accept"):
				reset_game()
		
	if(position.y < 0):
		enable_jump = false

	if(position.y > 800):
		enable_motion = false
