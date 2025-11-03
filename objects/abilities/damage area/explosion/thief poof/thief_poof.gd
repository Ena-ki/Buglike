extends Explosion


func _extra_checks(body : Node2D) -> bool:
  if body is DamageArea and _is_in_same_group(self.get_groups(), body):
    body.queue_free()
  for i in range(_tagged_entities.size()):
    if _tagged_entities[i] == body:
      return false
  return true


func _on_animated_sprite_2d_animation_finished() -> void:
  queue_free()
