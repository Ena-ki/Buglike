extends Area2D
class_name HealthComponent

signal healed(heal_amount)
signal damaged(damage_amount)
signal died()
signal revived()

var is_invulnderable : bool = false
var is_dead : bool = false :
  set(dead_value):
    Debug.log_warning("Do not set is_dead manualy, use revive() or kill() instead")
var max_health : int = 10 :
  set(new_max_health):
    Debug.log_warning("Do not set health manualy, use set_health() instead")
var health : int = 10 :
  set(new_health):
    Debug.log_warning("Do not set health manualy, use set_health() instead")


func damage(damage_amount : int):
  set_health(health - damage_amount)


func heal(heal_amount : int):
  set_health(health + heal_amount)


func revive(new_health : int = 1):
  is_dead = false
  set_health(new_health)
  emit_signal("revived")


func full_heal():
  set_health(max_health)


func kill():
  damage(max_health)


func set_max_health(new_max_health):
  new_max_health = max(new_max_health, 1)
  max_health = new_max_health
  if max_health > health:
    set_health(health)


func set_health(new_health):
  if is_dead == true:
    return

  if new_health <= health:
    emit_signal("damaged", health - new_health)
  else:
    emit_signal("healed", new_health - health)

  new_health = clampi(new_health, 0, max_health)
  health = new_health

  if health == 0:
    is_dead = true
    emit_signal("died")