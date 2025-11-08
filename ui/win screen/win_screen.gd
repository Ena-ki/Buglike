extends Control



func _on_quit_button_pressed() -> void:
  get_tree().change_scene_to_file(GameData.main_menu_path)

func _on_restart_button_pressed() -> void:
  get_tree().change_scene_to_file(GameData.game_path)
