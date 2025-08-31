extends Node

@export var dice_roll: Node
@export var mixzone: Area2D

@onready var result: RichTextLabel = $"../result"
@onready var dry: GridContainer = $"../dry"
@onready var wet: GridContainer = $"../wet"
@onready var LbPhase: Label = $"../LbPhase"
@onready var LbHowto: Label = $"../LbHowto"

var Ingredients = {
	"dry": ["cinnamon", "cocoa", "flour", "graham", "sugar"],
	"wet": ["banana", "butter", "chips", "chocolate", "cream", "egg", "jam", "honey", "milk", "peanutb", "vanilla"]
}



func _ready():
	dice_roll.connect("signal_roll", Callable(self, "_on_dice_rolled"))
	mixzone.connect("signal_mixzone_full", Callable(self, "_on_mixzone_full"))
		   
# ------------------ Phase Functions ------------------

func _on_mixzone_full():
	start_phase(Globals.current_phase+1)

func start_phase(phase):
	Globals.current_phase = phase
	LbPhase.text = "Phase: " + str(Globals.current_phase)
	match phase:
		1:
			dice_roll.visible = true
			dry.visible = false
			LbHowto.text = "Roll the dice"
		2:			
			wet.visible = true
			dice_roll.visible = false
			LbHowto.text = "Add 4 to continue"
		3:
			dice_roll.visible = true			
			wet.visible = false
			LbHowto.text = "Roll the dice"
		4:		
			LbHowto.text = "Roll for mixing"		
		5:		
			LbHowto.text = "Roll for texture check"	
		6:		
			LbHowto.text = "Roll for baking"		
		7:		
			LbHowto.text = "Roll for Plating"
		8:
			LbHowto.text = "The end"
			LbPhase.text = ""
			result.text = ""
			dice_roll.visible = false			
			

func _on_dice_rolled():
	match Globals.current_phase:
		1:	
			result.text = ClassifyRoll()
			print(Globals.Rolld1)
			print(Globals.Rolld2)
			start_phase(2)
		2:
			result.text = ClassifyRoll()
			start_phase(3)
		3:
			result.text = ClassifyRoll()
			start_phase(4)
		4:
			result.text = ClassifyRoll()
			start_phase(5)
		5:
			result.text = ClassifyRoll()
			start_phase(6)
		6:
			result.text = ClassifyRoll()
			start_phase(7)
		7:
			start_phase(8)			

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
