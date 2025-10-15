@abstract extends Resource
class_name Ability

@export var cooldown : float = 1.0
var cooldown_left : float = 0.0
var is_active : bool = false

func execute(caster : Entity):
  if cooldown_left > 0:
    return
  _execute(caster)
  if cooldown > 0.05:
    cooldown_left = cooldown
  pass


func update(_delta : float):
  pass


@abstract func _execute(caster : Entity)