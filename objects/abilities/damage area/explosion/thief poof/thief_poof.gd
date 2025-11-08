extends Explosion


func _on_animated_sprite_2d_animation_finished() -> void:
  queue_free()


func _on_area_entered(area: Area2D) -> void:
  if area is not DamageArea:
    return
  if is_in_same_group(get_groups(),area):
    return
  area._die()
