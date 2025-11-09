extends Ability

@export_category("references")
@export var auto_aim : AutoAimComponent
@export var bullet_maker : BulletMaker
@export_category("stats")
@export var damage : int = 1
@export var bullet_speed : float = 100.0
@export var shot_number : int = 3
@export var spread : float = 15.0

var cur_shot_number : int = 2


func _execute(caster : Entity) -> void:
  cur_shot_number = (cur_shot_number + 1) % shot_number

  var closest_body = auto_aim.get_closest_enemy(caster)
  var shot_direction : Vector2
  if closest_body == null:
    shot_direction = caster.look_direction
  else:
    shot_direction = closest_body.position - caster.position
  for i in range(cur_shot_number + 1):
    var shot_rotation = deg_to_rad((spread * cur_shot_number) / 2 - i * spread)
    var bullet = bullet_maker.make_bullet(caster, shot_direction.rotated(shot_rotation))
    bullet.speed = bullet_speed
    bullet.damage = damage
  
