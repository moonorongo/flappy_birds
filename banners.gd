extends StaticBody2D

var banner_spr

var files_arr = [
	'fr_images/banner4.jpg',
	'fr_images/banner5.png',
	'fr_images/banner6.png']

var files_idx = 0
onready var banner_timer = get_node("banner_timer")


func _ready():
	banner_spr = get_node("banners_spr")
	update_banner()
	banner_timer.start()
	files_idx += 1




func _on_banner_timer_timeout():
	
	if(files_idx >=  files_arr.size()):
		files_idx = 0
		
	update_banner()
	files_idx += 1



func update_banner():
	banner_spr.set_texture(load(files_arr[files_idx]));
