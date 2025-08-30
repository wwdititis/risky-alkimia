extends Node2D
signal signal_roll

@onready var btnRoll: Button = $btnRoll
@onready var d1: AnimatedSprite2D = $d1
@onready var d2: AnimatedSprite2D = $d2
@onready var dice_before: AudioStreamPlayer = $dice_before
@onready var dice_after: AudioStreamPlayer = $dice_after

var btnpressed = false

func _ready():
	btnRoll.pressed.connect(_on_btnRoll_pressed)
	randomize()

func _on_btnRoll_pressed():
	btnpressed = true
	dice_before.play()
	btnRoll.disabled = true
	roll_dice(0.5)		
	btnRoll.disabled = false
	
func roll_dice(seconds):
	d1.play("rolling")
	d2.play("rolling")
	var timer = get_tree().create_timer(seconds)
	timer.timeout.connect(_on_dice_timeout)
	
func _on_dice_timeout():
	if btnpressed:
		dice_after.play()
	d1.stop()
	d2.stop()
	var resultd1 = randi_range(1, 6)
	var resultd2 = randi_range(1, 6)
	d1.animation = "dface"
	d2.animation = "dface"
	d1.frame = resultd1-1
	d2.frame = resultd2-1
	Globals.Rolld1 = resultd1
	Globals.Rolld2 = resultd2
	Globals.RollResult = resultd1 + resultd2
	emit_signal("signal_roll")

	
