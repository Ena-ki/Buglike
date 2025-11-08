extends Bullet

@export var explosion_bullets : int = 10
@export var bullet_speed : float = 90.0
var caster : Enemy


func _exit_tree() -> void:
  var bullet_groups = caster.get_groups()
  var spread_angle := 360.0 / explosion_bullets
  for i in range(explosion_bullets):
    var bullet_dir := Vector2.UP.rotated(deg_to_rad(spread_angle * i))
    var bullet = caster.object_pool._pull_from_pool()
    bullet.add_to_groups(bullet_groups)
    bullet.position = position
    bullet.direction = bullet_dir
    bullet.lifetime = 3
    bullet.speed = bullet_speed
