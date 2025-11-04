extends Ability

@export var dash_speed : float = 1.0
@export var dash_duration : float = 0.5

var dash_duration_remains : float
var _caster : Player 


func _execute(caster : Entity) -> void:
  dash_duration_remains = dash_duration
  if _caster != caster:
    _caster = caster
  caster.legs_occupied = true
  is_active = true
  caster.is_invulnderable = true
  if _caster is Player:
    _caster.anims.set("parameters/roll/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)


func update(_delta : float) -> void:
  dash_duration_remains -= _delta
  if dash_duration_remains <= 0:
    _clean_up()
  _caster.velocity = _caster.look_direction * dash_speed * _caster.movement_speed


func _clean_up():
  is_active = false
  _caster.legs_occupied = false
  _caster.is_invulnderable = false
  _caster.velocity = Vector2.ZERO
