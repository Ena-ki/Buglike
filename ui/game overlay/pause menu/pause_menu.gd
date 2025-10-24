extends SubMenu



func _on_main_menu_button_pressed() -> void:
  get_tree().change_scene_to_file(GameData.main_menu_path)

func _on_resume_button_pressed() -> void:
  emit_signal("go_back")
