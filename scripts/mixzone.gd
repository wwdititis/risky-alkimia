extends Area2D

@export var new_texture: Texture2D
var dry = 0
var max_dry := 3
var max_wet := 4  
var dropped_dry := []
var dropped_wet := []
signal signal_mixzone_full

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if body is DraggablePiece:
		dropped_dry.append(dry+1)
		dry =+ 1
		print(dropped_dry)
		print("Dropped into zone!")
		if dropped_dry.size() == max_dry:
			emit_signal("signal_mixzone_full")
			print("DropZone full!")
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
		
