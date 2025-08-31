extends Area2D

@export var new_texture: Texture2D

var c = 0
var max_dry := 3
var max_wet := 4  
var dropped_dry := []
var dropped_wet := []
var dropped := []
signal signal_mixzone_full

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
		if dropped.size() == max_wet and Globals.current_phase == 2:
			emit_signal("signal_mixzone_full")
			print("DropZone full!")
			c = 0
			dropped = []
		# Remove draggable from the scene
		if new_texture:
			$Sprite2D.texture = new_texture
		body.queue_free()
		
#func register_drop(item: Node):
	#if max_items > 0 and dropped_items.size() >= max_items:
		#print("DropZone full!")
		#return
	#
	#dropped_items.append(item)
	#print("Item dropped! Total:", dropped_items.size())
	#
	#emit_signal("item_dropped", item)		
		
