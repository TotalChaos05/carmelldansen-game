extends Node

signal sixteenth
signal eighth
signal quarter
signal beat
signal bar

export var bpm = 165
export var beats_per_bar = 4
var time_left = 0

var bps = 60.0 / bpm
var sixteenth = 0
var eighth = 0
var quarter = 0
var beat = 0
var wait_time
# Called when the node enters the scene tree for the first time.
func _ready():
	$eighth.wait_time = bps/4
	wait_time = bps/4
	Global.wait_time = bps/4
	print(bpm,bps,$eighth.wait_time)
	$eighth.start()
	$AudioStreamPlayer.play()
	Global.bpm = bpm




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	time_left = $eighth.time_left


func _on_eighth_timeout():
	eighth+=1
	emit_signal("eighth")
	if eighth == 4:
		eighth = 0
		quarter+=1
		emit_signal("quarter")
	if quarter == 4:
		emit_signal("beat")
		quarter = 0
		beat+=1
	if beat == beats_per_bar:
		emit_signal("bar")
		beat = 0
