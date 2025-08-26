extends Button

@export var hover_sound: AudioStream
@export var flair_sound: AudioStream

func _ready():
	if hover_sound:
		mouse_entered.connect(_play_hover)
	if flair_sound:
		pressed.connect(_play_flair)

func _play_hover():
	Globals.playSFX(hover_sound)

func _play_flair():
	Globals.playSFX(flair_sound)
