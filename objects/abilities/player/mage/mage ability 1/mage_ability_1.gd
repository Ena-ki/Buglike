extends Ability

@export_category("references")
@export var auto_aim : AutoAimComponent
@export var bullet_maker : BulletMaker
@export_category("stats")
@export var damage : int = 1
@export var bullet_speed : float = 100.0


func _execute(caster : Entity):
  var closest_body = auto_aim.get_closest_enemy(caster)
  if closest_body == null:
    return
  var bullet = bullet_maker.make_bullet(caster, closest_body.position - caster.position)
  bullet.speed = bullet_speed
  bullet.damage = damage