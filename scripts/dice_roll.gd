extends Node2D

@onready var btnRoll: Button = $btnRoll
@onready var d1: AnimatedSprite2D = $d1
@onready var d2: AnimatedSprite2D = $d2
@onready var dice_before: AudioStreamPlayer = $dice_before
@onready var dice_after: AudioStreamPlayer = $dice_after
@onready var LbResult: Label = $"../LbResult"

var btnpressed = false

func _ready() -> void:
	randomize()
	roll_dice(0)

func _on_btnRoll_pressed() -> void:	
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
	Globals.RollResult = resultd1 + resultd2
#	LbResult.text = str(Globals.RollResult) +" "+ ClassifyRoll(resultd1, resultd2)
	
#func ClassifyRoll(d1: int, d2: int) -> String:
	#var roll = d1 + d2
	#if d1 == 6 and d2 == 6:
		#return "Legendary"
	#elif d1 == 5 and d2 == 5:
		#return "Secret Bonus"		
	#elif d1 == 4 and d2 == 4:
		#return "Great plating"			
	#elif d1 == 3 and d2 == 3:
		#return "Great plating"		
		#if roll >= 12:
			#return "Signature"
		#elif roll >= 12:
			#return "Signature"
		#elif roll >= 10:
			#return "Success"
		#elif roll >= 7:
			#return "Salvageable"
		#elif roll >= 2:
			#return "Disaster"
		#else:
			#return "Invalid" # e.g. 0 or 1
