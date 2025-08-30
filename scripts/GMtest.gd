extends Node

@export var dice_roll: Node
@onready var result: RichTextLabel = $"../result"
@onready var dry: GridContainer = $"../dry"
@onready var wet: GridContainer = $"../wet"

var current_phase = 1

var Ingredients = {
	"dry": ["cinnamon", "cocoa", "flour", "graham", "sugar"],
	"wet": ["banana", "butter", "chips", "chocolate", "cream", "egg", "jam", "honey", "milk", "peanutb", "vanilla"]
}


func _ready():
	dice_roll.connect("signal_roll", Callable(self, "_on_dice_rolled"))
	start_phase(1)

# ------------------ Phase Functions ------------------

func start_phase(n: int):
	current_phase = n
	print("Phase: " + str(current_phase))
	match n:
		1:
			dice_roll.visible = true
	
func _on_dice_rolled():
	match current_phase:
		1:	
			start_phase(2)
			print("Phase 1")	
			result.text = ClassifyRoll()		
			print(Globals.Rolld1)
			print(Globals.Rolld2)
			current_phase = 2
		2:
			start_phase(3)
			print("Phase 2")
			dry.visible = false
			wet.visible = true
		3:
			start_phase(3)
			print("Phase 3")
		4:
			start_phase(3)
			print("Phase 4")
		5:
			start_phase(3)
			print("Phase 5")
		6:
			start_phase(3)
			print("Phase 6")

func ClassifyRoll() -> String:
	var d1 = Globals.Rolld1
	var d2 = Globals.Rolld2
	var roll = d1 + d2
	if d1 == 6 and d2 == 6:
		return "Legendary"
	elif d1 == 5 and d2 == 5:
		return "Secret Bonus"		
	elif d1 == 4 and d2 == 4:
		return "Great plating"			
	elif d1 == 3 and d2 == 3:
		return "Great flavor but odd texture"		
	elif d1 == 2 and d2 == 2:
		return "Recipe tastes okay but looks awful"			
	elif d1 == 1 and d2 == 1:
		return "Total disaster! The oven explodes, flour everywhere"				
	elif roll >= 12:
		return "Signature"
	elif roll >= 12:
		return "Signature"
	elif roll >= 10:
		return "Success"
	elif roll >= 7:
		return "Salvageable"
	elif roll >= 2:
		return "Disaster"
	else:
		return "Invalid" # e.g. 0 or 1
