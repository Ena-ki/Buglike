@abstract class_name Entity extends CharacterBody2D

signal damaged(damage)
signal died()

@export var attributes : EntityAttributes

var health : float = 1000


func set_up_resources():
  attributes = attributes.duplicate()


func damage(damage : float):
  health -= damage
  if health <= 0:
    emit_signal("died")
  emit_signal("damaged", damage)
  print(get_class(), "'s health is :", health)
