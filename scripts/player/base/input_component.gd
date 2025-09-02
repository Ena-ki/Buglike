extends Node
class_name InputComponent

var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
var player_number_string = "player_1_"


func set_player_number(new_player_number : Enums.PlayerNumber) -> void:
  player_number = new_player_number
  match player_number:
    Enums.PlayerNumber.PLAYER_1:
      player_number_string = "player_1_"
    Enums.PlayerNumber.PLAYER_2:
      player_number_string = "player_2_"
    Enums.PlayerNumber.PLAYER_3:
      player_number_string = "player_3_"
    Enums.PlayerNumber.PLAYER_4:
      player_number_string = "player_4_"



func get_movement_vector() -> Vector2:
  return Input.get_vector(
    player_number_string + "left", 
    player_number_string + "right",
    player_number_string + "up",
    player_number_string + "down",)



func is_ability_1_pressed() -> bool:
  return Input.is_action_just_pressed(player_number_string + "ability_1")



func is_ability_2_pressed() -> bool:
  return Input.is_action_just_pressed(player_number_string + "ability_2")



func is_ability_3_pressed() -> bool:
  return Input.is_action_just_pressed(player_number_string + "ability_3")



func is_ability_4_pressed() -> bool:
  return Input.is_action_just_pressed(player_number_string + "ability_4")


