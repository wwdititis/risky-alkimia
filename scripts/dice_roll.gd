extends Node2D

@onready var roll_btn: Button = $roll_btn
@onready var d1: AnimatedSprite2D = $d1
@onready var d2: AnimatedSprite2D = $d2

func _ready() -> void:
	randomize()
	roll_dice(0)

func _on_roll_btn_pressed() -> void:
	roll_btn.disabled = true
	roll_dice(0.5)
	roll_btn.disabled = false
	
func roll_dice(seconds):
	d1.play("roll")
	d2.play("roll")
	var timer = get_tree().create_timer(seconds)
	timer.timeout.connect(_on_dice_timeout)
	
func _on_dice_timeout():
	d1.stop()
	d2.stop()
	var resultd1 = randi_range(1, 6)
	var resultd2 = randi_range(1, 6)
	d1.frame = resultd1-1
	d2.frame = resultd2-1
