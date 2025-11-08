class_name DamageArea
extends Area2D

signal hit(body : Entity)

@export var damage : int = 1

var _bodies_inside : Array[Entity] = []


func _on_ready() -> void:
  pass


func _extra_checks(_body : Node2D) -> bool:
  return true


func _ready() -> void:
  body_entered.connect(on_damage_area_body_entered)
  body_exited.connect(on_damage_area_body_exited)
  Tick.timeout.connect(on_tick_timeout)
  _on_ready()


func on_tick_timeout():
  if is_visible_in_tree() == false:
    return
  var bodies := get_overlapping_bodies()
  if bodies == []:
    return
  for i in range(bodies.size()):
    if check_body(bodies[i]) == false:
      continue
    _damage_entity(bodies[i], damage)


func on_damage_area_body_entered(body : Node2D):
  if is_visible_in_tree() == false:
    return
  if check_body(body) == false:
    return
  _bodies_inside.append(body)
  _damage_entity(body, damage)


func on_damage_area_body_exited(body : Node2D):
  if is_visible_in_tree() == false:
    return
  _bodies_inside.find(body)


func add_to_groups(groups : Array[StringName]) -> void:
  for i in range(groups.size()):
    add_to_group(groups[i])


func _damage_entity(body: Node2D , damage_amount: int):
  emit_signal("hit", body)
  body.health.damage(damage_amount)


func check_body(body : Node2D) -> bool:
  if _extra_checks(body) == false:
    return false
  if body is not Entity:
    return false
  if is_in_same_group(get_groups(), body):
    return false
  if body.health == null or body.health.is_dead or body.is_invulnderable:
    return false
  return true


func is_in_same_group(group_arr: Array[StringName], body: Node2D) -> bool:
  for i in range(group_arr.size()):
    if body.is_in_group(group_arr[i]):
      return true
  return false