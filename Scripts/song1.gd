extends Node

var sync = load("res://Scripts/sync.gd")
var bar_scn = preload("res://Scenes/bar.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# format of songs, recursive arrays
# 1st bracket has full song, second has 8 beat section, 3rd has notes pplayed on said beats

var song = [[[1],[1],[1],[1],[1],[1],[1],[1]],[[2],[2],[2],[2],[2],[2],[2],[2]]]
# Called when the node enters the scene tree for the first time.
func _ready():
	var bar = bar_scn.instance()
	bar.data = song[0]
	$VBoxContainer.add_child(bar)
	$VBoxContainer.move_child(bar,0)


