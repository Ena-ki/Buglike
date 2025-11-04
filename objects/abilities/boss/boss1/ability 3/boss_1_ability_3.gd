extends Ability

@export var explosive_bullet : PackedScene
@export var auto_aim : AutoAimComponent
@export var bullet_speed : float = 90.0


func _execute(caster : Entity) -> void:
  if caster is not Enemy:
    return
  var closest_enemy = (auto_aim.get_closest_enemy(caster))
  if closest_enemy == null:
    return
  var shoot_dir = (closest_enemy.position - caster.position).normalized()
  var bullet = explosive_bullet.instantiate() as Bullet
  bullet.groups = caster.get_groups()
  bullet.position = caster.position
  bullet.direction = shoot_dir
  bullet.lifetime = 1.5
  bullet.speed = bullet_speed
  bullet.caster = caster
  get_tree().current_scene.add_child(bullet)
