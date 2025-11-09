extends Ability

@export var shot_speed : float = 100.0
@export var bullet_speed : float = 90.0

var STREAMS : int = 4


func _execute(caster : Entity) -> void:
  is_active = true

  var bullet_groups = caster.get_groups()
  var spread_angle := 360.0 / STREAMS
  for i in range(20):
    if caster.health.is_dead:
      return
    for j in range(STREAMS):
      var bullet_dir := Vector2.UP.rotated(deg_to_rad(spread_angle * j + i * 15))
      var bullet := caster.object_pool._pull_from_pool() as Bullet
      bullet.add_to_groups(bullet_groups)
      bullet.position = caster.position
      bullet.direction = bullet_dir
      bullet.speed = bullet_speed
      bullet.lifetime = 3
    await get_tree().create_timer(0.25).timeout

  is_active = false
