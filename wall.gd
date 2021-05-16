extends StaticBody2D

var velocity = Vector2.ZERO
var original_position
export (int) var speed = -4

var rng = RandomNumberGenerator.new()
var game
var score_hitbox
var sprite_top
var sprite_bottom
var wall_textures_top_index
var wall_textures_bottom_index
var wall_textures_top = ["top_wall_h_1.png", "top_wall_h_2.png", "top_wall_h_3.png"]
var wall_textures_bottom = ["bottom_wall_h_1.png", "bottom_wall_h_2.png", "bottom_wall_h_3.png"]

func _ready():
	set_z_index(10)
	game = get_tree().get_root().get_node("Game")
	sprite_top = get_node("wall_top/top")
	sprite_bottom = get_node("wall_bottom/bottom")
	score_hitbox = get_node("score_hitbox")
	
	# set initial position
	rng.randomize()
	original_position = Vector2(rng.randi_range(700, 1110), 840)
	position = original_position
	
	wall_textures_top_index = rng.randi_range(0, 2)
	wall_textures_bottom_index = wall_textures_top_index + 1
	if wall_textures_bottom_index > 2:
		wall_textures_bottom_index = 0
	
	# set texture (to be continued tomorrow)
	sprite_top.texture = load("res://assets/" + wall_textures_top[wall_textures_top_index])
	sprite_bottom.texture = load("res://assets/" + wall_textures_bottom[wall_textures_bottom_index])
	set_process(true)


func _process(delta):
	position += Vector2(0, speed)
	
	if(get_position().y < -90):
		queue_free()


func _on_Area2D_body_entered(body):
	if(body.get_name() == "flappy"):
		score_hitbox.queue_free()
		game.increase_score()

