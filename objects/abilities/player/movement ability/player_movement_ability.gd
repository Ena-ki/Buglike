extends Ability
class_name PlayerMovementAbility

@export var movement_speed = 100.0


func _execute(caster : Entity) -> void:
  if caster.attributes.legs_occupied == true:
    return
  var player_number_string = "player_" + str(caster.player_number) + "_"
  
  var direction = Input.get_vector(
    player_number_string + "left",
    player_number_string + "right",
    player_number_string + "up",
    player_number_string + "down",
  )
  caster.velocity = direction * movement_speed