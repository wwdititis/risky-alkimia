extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_btnstartgame_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GameLevel.tscn")

func _on_btnsettings_pressed() -> void:
	add_child(Globals.Settings.instantiate())

func _on_btnquit_pressed() -> void:
	get_tree().quit()
