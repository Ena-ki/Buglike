class_name Idle extends PlayerState




func update(delta : float):
  if owner.health <= 0:
    emit_signal("transition", self, "Died")


  if owner.velocity.length() >= 1.0:
    emit_signal("transition", self, "walking")
