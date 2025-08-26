extends Button

@export var hover_sound: AudioStream
@export var click_sound: AudioStream

func _ready():
	if hover_sound:
		mouse_entered.connect(_play_hover)
	if click_sound:
		pressed.connect(_play_click)

func _play_hover():
	Globals.playSFX(hover_sound)

func _play_click():
	Globals.playSFX(click_sound)
