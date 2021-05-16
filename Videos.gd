extends Node2D

var video_player
var video_stream
var files_arr
var files_idx = 0

onready var startscreen_timer = get_node("startscreen_timer")


# Called when the node enters the scene tree for the first time.
func _ready():
	video_stream = VideoStreamWebm.new()
	video_player = get_node("videoPlayer")
	files_arr = list_files_in_directory('fr_videos/')
	play_next_video()
	
	
func hide_videos():
	video_player.stop()
	video_player.hide()
	#startscreen.hide_startscreen()
	
func show_videos():
	video_player.show()
	video_player.play()
	#startscreen.show_startscreen()
		
		
# TODO: armar startscreen, con la animacion de la manito
# y el control que salta cuando apreta el control		

func play_next_video():
	if(files_idx >=  files_arr.size()):
		files_idx = 0
			
	video_stream.set_file(files_arr[files_idx])
	video_player.stream = video_stream
	video_player.play()
	files_idx += 1


func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true)

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif ( file.ends_with('webm') ):
			files.append(path + file)
			
	dir.list_dir_end()
	return files


func _on_videoPlayer_finished():
	# poner el instructico (otro movie)
	# activar el timer 
	# cuando termina el timer playear el siguiente
	play_next_video()
