extends Node

var Settings = preload("res://modals/settings.tscn")
var HowTo = preload("res://modals/instructions.tscn")
var Credits = preload("res://modals/credits.tscn")
var Main = preload("res://scenes/Main.tscn")

#Preloads sound effects
var sfx_hover:= preload("res://assets/sfx/Retro1.wav")
var sfx_flair:= preload("res://assets/sfx/African4.wav")
var bgmusic:= preload("res://assets/sfx/MysticForest.ogg")

@onready var sfxPlayer := AudioStreamPlayer.new()
@onready var bgPlayer := AudioStreamPlayer.new()

var sfx_volume := 0.05 # Default volumes
var bg_volume := 0.005

enum Phase { WAIT, PHASE1, PHASE2, PHASE3 } #STATES
var current_phase = Phase.WAIT

var Rolld1 = 0
var Rolld2 = 0
var RollResult = 0

func _ready():
	add_child(sfxPlayer)
	sfxPlayer.bus = "SFX"
	set_sfx_volume(sfx_volume)
	add_child(bgPlayer)
	bgPlayer.bus = "MUSIC"
	set_music_volume(bg_volume)	
	bgmusic.loop = true
	playMusic(bgmusic)

#Plays sound effect function
func playSFX(stream: AudioStream):
	sfxPlayer.stream = stream
	sfxPlayer.play()
	
func playMusic(stream: AudioStream):
	bgPlayer.stream = stream
	bgPlayer.play()	

# Functions to control volumes
func set_sfx_volume(value: float):
	sfx_volume = clamp(value, 0, 1)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(sfx_volume))

func set_music_volume(value: float):
	bg_volume = clamp(value, 0, 1)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("MUSIC"), linear_to_db(bg_volume))
