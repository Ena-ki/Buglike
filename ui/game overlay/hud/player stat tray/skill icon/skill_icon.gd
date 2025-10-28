extends TextureRect


func _ready():
  material = material.duplicate()


func update(ability : Ability):
  if ability.icon != null and texture != ability.icon:
    texture = ability.icon
  var cooldown = ability.cooldown_left / ability.cooldown
  material.set_shader_parameter("cooldown", clamp(cooldown,0.0,1.0))


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
