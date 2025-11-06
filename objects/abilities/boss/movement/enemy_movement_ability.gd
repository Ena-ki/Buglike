extends Ability

@export var auto_aim : AutoAimComponent
@export var dash_speed : float = 1.0
@export var dash_duration : float = 0.5

var dash_duration_remains : float
var _caster : Enemy 
var walk_dir : Vector2 = Vector2.ZERO


func _execute(caster : Entity) -> void:
  var closest_body = auto_aim.get_closest_enemy(caster)
  if closest_body != null:
    walk_dir = (closest_body.position - caster.position).normalized()
  if walk_dir == Vector2.ZERO:
    walk_dir = Vector2.UP.rotated(randf_range(0,6.283))
  dash_duration_remains = dash_duration
  if _caster != caster:
    _caster = caster
  caster.legs_occupied = true
  is_active = true


func update(_delta : float) -> void:
  dash_duration_remains -= _delta
  if dash_duration_remains <= 0:
    _clean_up()
    return
  _caster.velocity = walk_dir * dash_speed * _caster.movement_speed


func _clean_up():
  is_active = false
  _caster.legs_occupied = false
  _caster.velocity = Vector2.ZERO
  walk_dir = Vector2.ZERO
