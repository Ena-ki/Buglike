class_name Walking extends State


func enter():
  print("entered walking state")


func exit():
  print("exiting walking state")


func update(delta : float):
  if owner.health <= 0:
    emit_signal("transition", self, "Died")