extends TextureRect

var dist
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	dist = get_parent().rect_scale.x
	self.rect_position.x = self.rect_position.x + (dist/Global.wait_time*32)*delta

	
