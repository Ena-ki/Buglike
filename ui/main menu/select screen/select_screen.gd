extends SubMenu

func _process(_delta) -> void:
  if Input.is_action_just_pressed("ui_cancel"):
    emit_signal("go_back")


func _on_start_button_pressed() -> void:
  if check_players_ready() == false:
    return
    
  get_tree().change_scene_to_file(GameData.game_path)


func check_players_ready() -> bool:
  for i in GameData.players:
    if i == true:
      return true
  return false