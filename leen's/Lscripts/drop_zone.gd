extends Area2D
@export var new_texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is DraggablePiece:
		print("Dropped into zone!")
		# Remove draggable from the scene
		if new_texture:
			$Sprite2D.texture = new_texture
		body.queue_free()
		
