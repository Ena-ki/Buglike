extends Control
@export_custom(PROPERTY_HINT_FILE, "*.tscn") var game_scene : String

@export var main_screen : Control

@export var select_screen : SubMenu

var _active_screen : Control
  

func _ready():
  _active_screen = main_screen


func _on_select_screen_go_back() -> void:
  switch_screen(main_screen)


func switch_screen(new_screen : Control) -> void:
  if new_screen == _active_screen:
    return
  _active_screen.visible = false
  _active_screen = new_screen
  _active_screen.visible = true



func _on_quit_button_pressed() -> void:
  get_tree().quit()


func _on_play_button_pressed() -> void:
  switch_screen(select_screen)
