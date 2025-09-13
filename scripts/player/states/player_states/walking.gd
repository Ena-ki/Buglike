class_name Walking extends PlayerState


func update(delta : float):
  if owner.velocity.length() < 1.0:
    emit_signal("transition",self, "idle")
  
  if owner.health <= 0:
    emit_signal("transition", self, "Died")
