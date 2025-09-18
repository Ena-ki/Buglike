@abstract
class_name Entity extends CharacterBody2D

#stats
var health : float = 100
var is_invunderable : bool = false
@export var can_move : bool = true

signal damaged(damage)
signal died()


func damage(damage : float):
  health -= damage
<<<<<<< HEAD:scripts/utilities/entity.gd
=======
  emit_signal("damaged", damage)
  if health <= 0:
    emit_signal("died")
>>>>>>> origin/tena:scripts/utilities/enitity.gd
