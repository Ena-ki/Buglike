@abstract class_name Entity extends CharacterBody2D

signal damaged(damage)
signal died()

@export var attributes : EntityAttributes

var health : float = 100


func _ready():
  attributes = attributes.duplicate()


func damage(damage : float):
  health -= damage
  if health <= 0:
    emit_signal("died")
  emit_signal("damaged", damage)