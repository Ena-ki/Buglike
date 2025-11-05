extends Explosion


func _on_animated_sprite_2d_animation_finished() -> void:
  queue_free()


func _on_area_entered(area: Area2D) -> void:
  if area is not DamageArea:
    return
  print("yes")
  var group_arr := self.get_groups()
  for i in range(group_arr.size()):
    if area.is_in_group(group_arr[i]):
      return
  area._die()
