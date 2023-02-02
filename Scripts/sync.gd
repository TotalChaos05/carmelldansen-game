extends Node

signal eighth
signal quarter
signal beat
signal bar

export var bpm = 165
var bps = 60.0 / bpm
var eighth = 0
var quarter = 0
var beat = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Eighth.wait_time = bps/16
	print(bpm,bps,$Eighth.wait_time)
	$Eighth.start()
	$AudioStreamPlayer.play()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Eighth_timeout():
	#print("Eighth!")
	eighth +=1
	emit_signal("eighth")
	if eighth == 4:
		eighth=0
		print("Quarter!")
		quarter+=1
		emit_signal("quarter")
	if quarter == 4:
		quarter = 0
		print("Beat!")
		beat+=1
		emit_signal("beat")
	if beat == 8:
		emit_signal("bar")
#		$Sprite.show()
#		$Sprite/blink.start()
#		yield($Sprite/blink,"timeout")
#		$Sprite.hide()

		


