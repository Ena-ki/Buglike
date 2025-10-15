extends Ability

@export var auto_aim : PackedScene


func _execute(caster : Entity):
  var auto_aim_instance = auto_aim.instantiate() as Area2D
  caster.add_child(auto_aim_instance)
  auto_aim_instance.global_position = caster
  var closest_body = find_closest_enemy(
      auto_aim_instance.get_overlapping_bodies(), 
      caster.global_position
  )
  auto_aim_instance.queue_free()

  closest_body
  

func find_closest_enemy(bodies : Array[Node2D], caster_pos : Vector2) -> Enemy:
  var closest_distance : float = 0
  var closest_body : Entity = null
  for body in bodies:
    if closest_body == null or body.global_position.distance_to(caster_pos) < closest_distance:
      closest_body = body
      closest_distance = body.global_position.distance_to(caster_pos)
  return closest_body


