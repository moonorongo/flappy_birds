extends Node2D

var Wall = preload("wall.tscn")

onready var timer = get_node("Timer")
onready var score_label = get_node("hid/score")
onready var max_score_label = get_node("hid/max_score")

var score
var max_score

func _ready():
	score = 0
	max_score = 0;
	timer.start()


func _on_Timer_timeout():
	var new_wall = Wall.instance()
	add_child(new_wall)


func increase_score():
	score += 1
	
	if(score > max_score):
		max_score = score
		
	update_score()
	
	
func update_score():
	score_label.set_text(str(score))
	max_score_label.set_text(str(max_score))

	
func reset_score():
	score = 0
	update_score()
		
		
