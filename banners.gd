extends StaticBody2D

var files_arr
var files_idx
var banner_ab_counter
onready var banner_spr = get_node("banners_spr")
onready var banner_timer = get_node("banner_timer")
onready var banner_ab = get_node("banner_ab")


func _ready():
	reset()

func reset():
	files_idx = 0
	banner_ab_counter = 1
	banner_spr.hide()
	banner_ab.show()
	files_arr = list_files_in_directory('fr_images/')
	banner_timer.start()

func stop():
	banner_ab.hide()
	banner_spr.hide()
	banner_timer.stop()

func start():
	reset()

func _on_banner_timer_timeout():
	if(files_idx >=  files_arr.size()):
		files_idx = 0
	
	if(banner_ab_counter == 4):
		banner_ab_counter = 0;
		banner_ab.show()
		banner_spr.hide()
	else:	
		update_banner()
		files_idx += 1
		banner_spr.show()
		banner_ab.hide()
	
	banner_ab_counter += 1


func update_banner():
	banner_spr.set_texture(load(files_arr[files_idx]));


func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true)

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif ( file.ends_with('jpg') or (file.ends_with('png')) ):
			files.append(path + file)
			
	dir.list_dir_end()
	return files
