extends StaticBody2D

var banner_spr

var files_arr

var files_idx = 0
onready var banner_timer = get_node("banner_timer")


func _ready():
	banner_spr = get_node("banners_spr")
	files_arr = list_files_in_directory('fr_images/')
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
