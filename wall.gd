extends StaticBody2D

var velocity = Vector2.ZERO
var original_position
export (int) var speed = -4

var rng = RandomNumberGenerator.new()
var game
var score_hitbox


func _ready():
	game = get_tree().get_root().get_node("Game")
	score_hitbox = get_node("score_hitbox")
	rng.randomize()
	
	original_position = Vector2(rng.randi_range(700, 1110), 840)
	position = original_position
	set_process(true)


func _process(delta):
	position += Vector2(0, speed)
	
	if(get_position().y < -90):
		queue_free()


func _on_Area2D_body_entered(body):
	if(body.get_name() == "flappy"):
		score_hitbox.queue_free()
		game.increase_score()

