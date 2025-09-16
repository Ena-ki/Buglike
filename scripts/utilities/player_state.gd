class_name PlayerState extends State


func enter():
  owner.damaged.connect(on_player_damaged)


func exit():
  owner.damaged.disconnect(on_player_damaged)


func on_player_damaged(damage):
  if owner.health <= 0.0:
    emit_signal("transition", self, "died")
  else:
    emit_signal("transition", self, "damaged")
