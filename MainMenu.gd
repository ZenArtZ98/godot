extends Control

onready var menu = $Menu
onready var settings = $Settings
onready var audio = $Audio
onready var credits = $Credits
var master_bus = AudioServer.get_bus_index("Master")

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()

func toggle():
	visible = !visible
	get_tree().paused = visible

func _on_Start_pressed():
	toggle()
	get_tree().change_scene("res://Intro.tscn")

func _on_Settings_pressed():
	show_and_hide(settings, menu)

func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_Audio_pressed():
	show_and_hide(audio, settings)

func _on_BackFromSettings_pressed():
	show_and_hide(menu, settings)

func _on_Master_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
	
func _on_BackFromAudio_pressed():
	show_and_hide(settings, audio)

func _on_Credits_pressed():
	show_and_hide(credits, menu)

func _on_BackFromCredits_pressed():
	show_and_hide(menu, credits)
