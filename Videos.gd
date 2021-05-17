extends Node2D

var video_player
var video_stream
var files_arr
var files_idx = 0

onready var startscreen_timer = get_node("startscreen_timer")
onready var startscreen = get_node("start_screen")


func _ready():
	video_stream = VideoStreamWebm.new()
	video_player = get_node("videoPlayer")
	files_arr = list_files_in_directory('fr_videos/')
	hide_videos()
	# testing
	show_videos()


func hide_videos():
	video_player.stop()
	video_player.hide()
	startscreen.hide()
	startscreen_timer.stop()


func show_videos():
	play_next_video()


func play_next_video():
	if(files_idx >=  files_arr.size()):
		files_idx = 0
	
	video_player.show()
	startscreen.hide()

	video_stream.set_file(files_arr[files_idx])
	video_player.stream = video_stream
	video_player.play()
	files_idx += 1


func show_startscreen():
	video_player.hide()
	startscreen.show()
	startscreen_timer.start()


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
	show_startscreen()


func _on_startscreen_timer_timeout():
	play_next_video()
