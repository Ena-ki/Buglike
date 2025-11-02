@abstract extends Node2D
class_name Ability

enum AbilitySlot{
  NO_SLOT = -1,
  SLOT_1 = 1,
  SLOT_2 = 2,
  SLOT_3 = 3,
  SLOT_4 = 4,
}

@export var icon : Texture2D 
@export var cooldown : float = 1.0
@export var takes_arms : bool = false
@export var takes_legs : bool = false

var slot := AbilitySlot.NO_SLOT
var cooldown_left : float = 0.0
var is_active : bool = false

@abstract func _execute(caster : Entity)


func execute(caster : Entity):
  if cooldown_left > 0:
    return
  if takes_arms and caster.arms_occupied:
    return
  if takes_legs and caster.legs_occupied:
    return
  _execute(caster)
  if cooldown > 0.05:
    cooldown_left = cooldown
  pass


func update(_delta : float):
  pass