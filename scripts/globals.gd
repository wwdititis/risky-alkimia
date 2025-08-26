extends Node

#Preloads modal windows
var Settings = preload("res://scenes/settings.tscn")
var HowTo = preload("res://scenes/instructions.tscn")
var Credits = preload("res://scenes/credits.tscn")

#Preloads sound effects
var sfx_hover:= preload("res://assets/sfx/Retro1.wav")
var sfx_flair:= preload("res://assets/sfx/African4.wav")

@onready var sfxPlayer := AudioStreamPlayer.new()

func _ready():
	add_child(sfxPlayer)

#Plays sound effect function
func playSFX(stream: AudioStream):
	sfxPlayer.stream = stream
	sfxPlayer.play()
