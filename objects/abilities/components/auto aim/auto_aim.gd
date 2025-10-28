class_name AutoAimComponent
extends Area2D


func get_closest_enemy(caster : Entity) -> Entity:
  var closest_body : Entity = null
  var closest_distance : float = 0
  var current_distance : float = 0 
  for body in get_overlapping_bodies():
    if body is not Entity or _is_in_same_group(caster.get_groups(), body):
      continue
    
    current_distance = (global_position - body.global_position).length()
    if closest_body == null or closest_distance < current_distance:
      closest_body = body
      closest_distance = current_distance
  return closest_body


func _is_in_same_group(groups : Array[StringName], body : Entity) -> bool:
  for group in groups:
    if body.is_in_group(group):
      return true
  return false
