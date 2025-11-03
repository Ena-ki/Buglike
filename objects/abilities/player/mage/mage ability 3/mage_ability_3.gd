extends Ability

@export_category("refs")
@export var bullet_maker : BulletMaker
@export_category("stats")
@export var spins : int = 1
@export var shots_in_spin : int = 10
@export var time_between_shots : float = 0.05
@export var bullet_speed : float = 200.0


func _execute(caster: Entity) -> void:
  is_active = true
  caster.arms_occupied = true
  for i in range(spins):
    for j in range(shots_in_spin):
      var shot_direction = Vector2.UP.rotated(deg_to_rad(360.0 / shots_in_spin * j + 15.0 * i))
      var bullet = bullet_maker.make_bullet(caster, shot_direction)
      bullet.speed = bullet_speed
      bullet.damage = 0
      await get_tree().create_timer(time_between_shots).timeout
  _clean_up(caster)



func _clean_up(caster) -> void:
  is_active = false
  caster.arms_occupied = false

