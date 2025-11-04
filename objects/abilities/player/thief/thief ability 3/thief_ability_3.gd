extends Ability

@export var movement_speed_mult : float = 2.5
@export var duration : float = 1.0
@export var thief_poof_scene : PackedScene


func _execute(caster : Entity) -> void:
  caster.movement_speed *= movement_speed_mult
  caster.is_invulnderable = true
  await get_tree().create_timer(duration).timeout
  var thief_poof = thief_poof_scene.instantiate() as Explosion
  thief_poof.groups = caster.get_groups()
  caster.add_child(thief_poof)
  clean_up(caster)


func clean_up(caster : Entity) -> void:
  caster.movement_speed /= movement_speed_mult
  caster.is_invulnderable = false
