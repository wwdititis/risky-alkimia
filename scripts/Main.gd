extends Node2D

@onready var score: Label = $CanvasLayer/HBoxContainer/Score

var NumScore = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_score_pressed() -> void:
	NumScore += 1
	score.text = str(NumScore)
