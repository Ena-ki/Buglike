extends Ability


func execute(caster : Player):
  var player_number_string = "player_" + str(caster.player_number) + "_"
  
  var direction = Input.get_vector(
    player_number_string + "left",
    player_number_string + "right",
    player_number_string + "up",
    player_number_string + "down",
  )
  caster.velocity = direction * caster.player_class.movement_speed
