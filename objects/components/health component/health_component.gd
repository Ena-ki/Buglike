extends Node
class_name HealthComponent

signal healed(heal_amount : int)
signal damaged(damage_amount : int)
signal died()
signal revived()

@export var i_frame_duration : float = 0
@export var sprite : Sprite2D

var max_health : int = 50
var health : int = 5

var is_dead : bool = false :
  set(val):
    is_dead = val
    if val == true and sprite:
      sprite.material.set_shader_parameter("is_invulnderable", 2)

var is_invulnderable : bool = false :
  set(val):
    is_invulnderable = val
    if sprite and not is_dead:
      sprite.material.set_shader_parameter("is_invulnderable", is_invulnderable)

var _invulnderable_timer : float = 0


func _process(delta: float) -> void:
  if _invulnderable_timer > 0:
    Debug.log(_invulnderable_timer)
    _invulnderable_timer -= delta
  elif _invulnderable_timer < 0:
    _invulnderable_timer = 0
  if is_invulnderable and _invulnderable_timer < 0:
    is_invulnderable = false


func damage(damage_amount : int):
  set_health(health - damage_amount)
  set_invulnderable(i_frame_duration)
  Debug.log(health + damage_amount, " to ", health)


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


func set_invulnderable(time : float):
  _invulnderable_timer += time
  if is_invulnderable == false:
    is_invulnderable = true
  