extends Ability

@export_category("references")
@export var auto_aim : AutoAimComponent
@export var swing_scene : PackedScene
@export_category("stats")
@export var swing_range : float = 10.0
@export var swing_linger_time : float = 0.3


func _execute(caster : Entity) -> void:
  var closest_body = auto_aim.get_closest_enemy(caster)
  var swing_dir : Vector2
  if closest_body == null:
    swing_dir = caster.look_direction
  else:
    swing_dir = (closest_body.position - caster.position).normalized()
  var swing = swing_scene.instantiate() as Explosion
  swing.position = swing_dir * swing_range
  swing.rotation = swing_dir.angle() + deg_to_rad(90.0)
  swing.add_to_groups(caster.get_groups())
  swing.explosion_duration = swing_linger_time
  caster.add_child(swing)