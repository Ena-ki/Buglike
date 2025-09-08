extends Node2D


func execute_ability(speed : float, player_ref : CharacterBody2D, player_number : int): # player number should be enum of PlayerNumber
  var player_number_string = "player_" + str(player_number) + "_"
  
  var direction = Input.get_vector(
    player_number_string + "left",
    player_number_string + "right",
    player_number_string + "up",
    player_number_string + "down",
  )
  player_ref.velocity = direction * speed
