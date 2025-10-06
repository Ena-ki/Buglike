@abstract class_name Ability extends Node2D

var cooldown : float = 0.0 : get = get_cooldown

@abstract func execute(caster)
@abstract func get_cooldown()


func get_closest_body(caster, bodies) -> Node2D:

  var closest_body : Node2D = null

  for body in bodies:
    if body == caster:
      continue

    if body is not Entity:
      continue

    if body.state_machine.current_state.name == "Dead":
      continue
    
    if !closest_body :
      closest_body = body
      continue
    
    var dist_to_closest = global_position.distance_to(closest_body.global_position)
    if dist_to_closest < global_position.distance_to(body.global_position):
      closest_body = body
  return closest_body

