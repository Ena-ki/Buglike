extends Control

@export var game_scene : PackedScene
@export var quit_button : Button
@export var play_button : Button


func _ready():
  quit_button.pressed.connect(on_quit_button_pressed)
  play_button.pressed.connect(on_play_button_pressed)
  


func on_quit_button_pressed():
  get_tree().quit()


func on_play_button_pressed():
  get_tree().change_scene_to_packed(game_scene)
  