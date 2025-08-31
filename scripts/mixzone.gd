extends Area2D

@onready var sprite2d: Sprite2D = $Sprite2D

var empty_bowl = "res://assets/food assets/ingredients/empty_bowl.png"
var flour_bowl = "res://assets/food assets/ingredients/flour_bowl.png"
var c = 0
var max_dry := 3
var max_wet := 4  
var dropped_dry := []
var dropped_wet := []
var dropped := []
signal signal_mixzone_full

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite2d.texture = load(empty_bowl)


func _on_body_entered(body: Node2D) -> void:
	if body is DraggablePiece:
		dropped.append(c+1)
		c = c + 1
		print(dropped)
		print("Dropped into zone!")
		if dropped.size() == max_dry and Globals.current_phase == 0:
			emit_signal("signal_mixzone_full")
			print("DropZone full!")
			c = 0
			dropped = []
			sprite2d.texture = load(flour_bowl)
		if dropped.size() == max_wet and Globals.current_phase == 2:
			emit_signal("signal_mixzone_full")
			print("DropZone full!")
			c = 0
			dropped = []
		# Remove draggable from the scene
		body.queue_free()
		
		
