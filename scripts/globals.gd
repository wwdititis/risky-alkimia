extends Node

#Preloads modal windows
var Settings = preload("res://modals/settings.tscn")
var HowTo = preload("res://modals/instructions.tscn")
var Credits = preload("res://modals/credits.tscn")

#Preloads sound effects
var sfx_hover:= preload("res://assets/sfx/Retro1.wav")
var sfx_flair:= preload("res://assets/sfx/African4.wav")

@onready var sfxPlayer := AudioStreamPlayer.new()

# Default volumes
var sfx_volume := 0.5
var music_volume := 0.5

func _ready():
	add_child(sfxPlayer)
	sfxPlayer.bus = "SFX"
	set_sfx_volume(sfx_volume)

#Plays sound effect function
func playSFX(stream: AudioStream):
	sfxPlayer.stream = stream
	sfxPlayer.play()

# Functions to control volumes
func set_sfx_volume(value: float):
	sfx_volume = clamp(value, 0, 1)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(sfx_volume))

func set_music_volume(value: float):
	music_volume = clamp(value, 0, 1)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(music_volume))
