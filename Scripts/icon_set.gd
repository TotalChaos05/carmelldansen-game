extends VBoxContainer
var square = preload("res://Scenes/icons/square.tscn")
var triangle = preload("res://Scenes/icons/triangle.tscn")
var circle = preload("res://Scenes/icons/circle.tscn")
var x = preload("res://Scenes/icons/X.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var n = 0
var data
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in data:
		print(data[n])
		if data[n] == 0:
			pass
		elif data[n] == 1:
			self.add_child(square.instance())
		elif data[n] == 2:
			self.add_child(x.instance())
		elif data[n] == 3:
			self.add_child(triangle.instance())
		elif data[n] == 4:
			self.add_child(circle.instance())
		else:
			pass
		n+=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
