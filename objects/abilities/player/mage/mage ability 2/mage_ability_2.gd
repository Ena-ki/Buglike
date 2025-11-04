extends Ability

@export_category("refs")
@export var auto_aim : AutoAimComponent
@export var bullet_maker : BulletMaker
@export_category("stats")
@export var max_charge : float = 1.0
@export var charge_speed : float = 1.0
@export var damage : int = 2
@export var shot_speed : float = 100.0

var _caster : Player 
var _charge : float = 0


func _execute(caster : Entity):
  if caster != _caster:
    _caster = caster
  if _caster is Player:
    is_active = true
    _caster.arms_occupied = true
  else:
    shoot()


func update(delta : float):
  if _charge <= max_charge:
    _charge += delta * charge_speed

  if !Input.is_action_pressed(str("player_", _caster.player_number, "_ability_", slot)):
    if _charge < max_charge:
      clean_up()
      return
    else:
      shoot()


func shoot():
  var closest_enemy = auto_aim.get_closest_enemy(_caster)
  if closest_enemy == null:
    clean_up()
    return
  var bullet = bullet_maker.make_bullet(_caster, closest_enemy.position - _caster.position)
  bullet.damage = 0
  bullet.explosion_damage = damage
  bullet.speed = shot_speed
  clean_up()


func clean_up():
  _charge = 0
  _caster.arms_occupied = false
  is_active = false
