@abstract class_name Entity extends CharacterBody2D

signal damaged(damage)
signal died()

var attributes : Dictionary ={
  "invunderable" = false,
  "can_move" = true,
  "dead" = false,
}
var health : float = 100


func damage(damage : float):
  health -= damage
  emit_signal("damaged", damage)
  if health <= 0:
    emit_signal("died")