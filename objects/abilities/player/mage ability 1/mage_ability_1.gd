extends Ability

@export var aim_area : Area2D
@export var bullet_scene : PackedScene


func _execute(caster : Entity):
  var closest_body = find_closest_enemy(
      aim_area.get_overlapping_bodies(), caster)

  if closest_body != null:
    instanciate_scene(closest_body.global_position, caster.global_position)
    


func instanciate_scene(body_pos, caster_pos):
  var bullet_instance = bullet_scene.instantiate()
  bullet_instance.stats.direction = (body_pos - caster_pos).normalized()
  bullet_instance.global_position = caster_pos
  get_tree().current_scene.add_child(bullet_instance)
  

func find_closest_enemy(bodies : Array[Node2D], caster : Entity) -> Enemy:
  var closest_distance : float = 0
  var closest_body : Entity = null
  for body in bodies:
    if body is not Entity or caster == body:
      continue
    if closest_body == null or body.global_position.distance_to(caster.global_position) < closest_distance:
      closest_body = body
      closest_distance = body.global_position.distance_to(caster.global_position)
  return closest_body
