extends Node

var song_source = preload("res://Scripts/song1.gd").new()


var song = song_source.data
var bar_scn = preload("res://Scenes/bar.tscn")
var syncer = preload("res://Scenes/sync.tscn")
var playing = false
var prog = 0
var syncer_inst = null
var score = 0
var note = 0
var bar
var score_add
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	bar = bar_scn.instance()
	bar.data = song[prog]
	$VBoxContainer.add_child(bar)
	$VBoxContainer.move_child(bar,0)
	self.add_child(syncer.instance())
	syncer_inst = get_node("syncer")
	syncer_inst.connect("bar", self, "_on_bar_complete")
	syncer_inst.connect("quarter", self, "_on_quarter_complete")
	
func _on_bar_complete():
	if playing:
		prog+=1
	print("Bar!")
	$VBoxContainer.remove_child(get_node("VBoxContainer/bar"))
	bar = bar_scn.instance()
	bar.data = song[prog]
	$VBoxContainer.add_child(bar)
	$VBoxContainer.move_child(bar,0)
	playing = not playing
	if playing:
		$Label.text = "PLAY!"
	else:
		$Label.text = "WATCH!"
#	print("playing: ", playing)

func _on_quarter_complete():
	note+=1
	if note == 8:
		note = 0
#	print(score)
func check_hit(press):
	if press in bar.data[note] and playing:
		score_add = abs(syncer_inst.time_left - (syncer_inst.wait_time/2))*10000
		score += score_add
		print(score_add)
	else:
		score_add = -200
		score+= score_add
	$Label2.text = "Score = " + str(score)
	$Label3.text = str(score_add)


func _on_square_pressed():
	check_hit(1)


func _on_x_pressed():
	check_hit(2)


func _on_triangle_pressed():
	check_hit(3)


func _on_circle_pressed():
	check_hit(4)
