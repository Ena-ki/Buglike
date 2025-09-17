class_name Idle extends PlayerState


func enter():
  owner.damaged.connect(on_player_damaged)


func exit():
  owner.damaged.disconnect(on_player_damaged)
  

func update(delta : float):
  if owner.velocity.length() >= 1.0:
    emit_signal("transition", self, "walking")
