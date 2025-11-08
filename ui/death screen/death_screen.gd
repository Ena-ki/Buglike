extends Control

@export var restart_button : Button
@export var quit_button : Button

func _ready():
  restart_button.pressed.connect(on_restart_button_pressed)
  quit_button.pressed.connect(on_quit_button_pressed)


func on_restart_button_pressed():
  get_tree().change_scene_to_file(GameData.game_path)


func on_quit_button_pressed():
  get_tree().change_scene_to_file(GameData.main_menu_path)
