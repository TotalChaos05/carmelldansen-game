extends Control

var icon_set_scn = preload("res://Scenes/icon_set.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var n=0
var data
var beats = 8
# Called when the node enters the scene tree for the first time.
func _ready():
#	print(data)
	for i in data:
		var icon_set = icon_set_scn.instance()
		icon_set.data = data[n]
		$HBoxContainer.add_child(icon_set)
		n+=1

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
