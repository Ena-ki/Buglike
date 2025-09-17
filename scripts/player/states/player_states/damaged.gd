class_name Damaged extends PlayerState

var damaged_timer : float


func enter():
  damaged_timer = 0.2
  owner.is_invunderable = true
  owner.died.connect(on_player_died)
  

func exit():
  owner.is_invunderable = false
  owner.died.disconnect(on_player_died)


func update(delta : float):
  if damaged_timer <= 0:
    if owner.velocity.length() <= 1.0:
      emit_signal("transition", self, "idle")
    elif owner.velocity.length() > 1.0:
      emit_signal("transition", self, "walking")
  damaged_timer -= delta