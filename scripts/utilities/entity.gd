@abstract class_name Entity extends CharacterBody2D

signal damaged(damage)
signal died()

@export var attributes : EntityAttributes

var health : float = 1000


func set_up_resources():
  attributes = attributes.duplicate()


func damage(damage_amount : float):
  health -= damage_amount
  if health <= 0:
    emit_signal("died")
  emit_signal("damaged", damage_amount)
  print(self, "'s health is :", health)
