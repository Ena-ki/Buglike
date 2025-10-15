extends Node
class_name AbilityComponent

@export var abilities : Array[Ability]

func _ready():
  for ability in abilities:
    ability = ability.duplicate()


func _process(delta):
  for ability in abilities:
    if ability.cooldown_left > 0.0:
      ability.cooldown_left -= delta
    if ability.is_active:
      ability.update(delta)