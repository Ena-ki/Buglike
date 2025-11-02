extends Node2D
class_name AbilityComponent

@export var abilities : Array[Ability]

func _ready():
  for i in range(abilities.size()):
    if abilities[i] != null:
      # ability from 1 to 4 fix please god i want to die it's like 5 degrees outside and i'm fucking freezing here
      if i > 0 and i < 5:
        abilities[i].slot = i as Ability.AbilitySlot


func _process(delta):
  for i in range(abilities.size()):
    if abilities[i] == null:
      continue
    if abilities[i].cooldown_left > 0.0 and not abilities[i].is_active:
      abilities[i].cooldown_left -= delta
    if abilities[i].is_active:
      abilities[i].update(delta)
