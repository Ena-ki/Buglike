@abstract extends Node2D
class_name Ability

@export var icon : Texture2D 
@export var cooldown : float = 1.0

var cooldown_left : float = 0.0
var is_active : bool = false

@abstract func _execute(caster : Entity)


func execute(caster : Entity):
  if cooldown_left > 0:
    return
  _execute(caster)
  if cooldown > 0.05:
    cooldown_left = cooldown
  pass


func update(_delta : float):
  pass