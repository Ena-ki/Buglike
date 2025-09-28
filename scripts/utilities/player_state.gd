@abstract class_name PlayerState extends State


func on_player_damaged(damage):
  if owner.health <= 0.0:
    emit_signal("transition", self, "died")
  else:
    emit_signal("transition", self, "damaged")


func on_player_died():
  emit_signal("transition", self, "died")
