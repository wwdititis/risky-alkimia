extends CharacterBody2D
class_name DraggablePiece

@export var texture: Texture2D
@export var drop_zone: Node

#flags
var dragging := false
var draggable := true
	
func _ready():
	$Sprite2D.texture = texture	
	
func _process(delta):
	if dragging and draggable:
		# Stick directly to mouse/touch position
		global_position = get_viewport().get_mouse_position()

func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not draggable:
		return
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		dragging = event.pressed
	elif event is InputEventScreenTouch and event.index == 0:
		dragging = event.pressed
		if dragging:
			global_position = event.position
			
func drop_to_zone(drop_zone: Node):
	# Move item to the drop zone
	drop_zone.add_child(self)
	drop_zone.register_drop(self)
