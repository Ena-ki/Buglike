class_name DamageArea
extends Area2D

signal hit(body : Entity)

@export var damage : int = 1
@export var groups : Array[StringName]


func _on_ready() -> void:
  pass


func _extra_checks(_body : Node2D) -> bool:
  return true


func _ready() -> void:
  body_entered.connect(on_damage_area_body_entered)
  Tick.timeout.connect(on_tick_timeout)
  _on_ready()


func on_tick_timeout():
  var bodies := get_overlapping_bodies()
  if bodies == []:
    return
  for i in range(bodies.size()):
    _damage_entity(bodies[i], damage)


func on_damage_area_body_entered(body : Node2D):
  _damage_entity(body, damage)


func _damage_entity(body: Node2D , damage_amount: int):
  if _extra_checks(body) == false:
    return
  if body is not Entity:
    return
  if _is_in_same_group(groups, body):
    return
  if body.health == null or body.health.is_dead or body.is_invulnderable:
    return
  emit_signal("hit", body)
  body.health.damage(damage_amount)


func _is_in_same_group(group_arr: Array[StringName], body: Entity) -> bool:
  for i in range(group_arr.size()):
    if body.is_in_group(group_arr[i]):
      return true
  return false
  
