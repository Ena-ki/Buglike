extends Ability

@export var bullet_speed : float = 90.0
@export var bullets_in_wave : int = 100




func _execute(caster : Entity) -> void:
  if caster is not Enemy:
    return
  
  var bullet_groups = caster.get_groups()
  var spread_angle := 360.0 / bullets_in_wave
  for i in range(bullets_in_wave):
    var bullet_dir := Vector2.UP.rotated(deg_to_rad(spread_angle * i))
    var bullet := caster.object_pool._pull_from_pool() as Bullet
    bullet.groups = bullet_groups
    bullet.position = caster.position
    bullet.direction = bullet_dir
    bullet.speed = bullet_speed
    bullet.lifetime = 3
