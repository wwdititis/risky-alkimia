extends Control

@onready var SliderSfx: HSlider = $CanvasLayer/SliderSfx
@onready var SliderMusic: HSlider = $CanvasLayer/SliderMusic
@onready var lbsfx: Label = $CanvasLayer/percentage/LbSfx
@onready var lbmusic: Label = $CanvasLayer/percentage/LbMusic

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SliderSfx.value = Globals.sfx_volume
	print(Globals.sfx_volume)
	SliderSfx.value_changed.connect(_on_slidersfx_value_changed)
	SliderMusic.value = Globals.bg_volume
	SliderMusic.value_changed.connect(_on_slidermusic_value_changed)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	

func _on_btnclose_pressed() -> void:
	queue_free()

func _on_slidersfx_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), db)
	Globals.set_sfx_volume(value)
	lbsfx.text = str(int(value*1000)) + "%"
	
func _on_slidermusic_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("MUSIC"), db)
	Globals.set_music_volume(value)
	lbmusic.text = str(int(value*1000)) + "%"
