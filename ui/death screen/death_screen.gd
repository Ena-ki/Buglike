extends Control

@export_custom(PROPERTY_HINT_FILE, "*.tscn") var main_menu_scene : String
@export var restart_button : Button
@export var quit_button : Button

func _ready():
  restart_button.pressed.connect(on_restart_button_pressed)
  quit_button.pressed.connect(on_quit_button_pressed)


func on_restart_button_pressed():
  pass


func on_quit_button_pressed():
  pass
