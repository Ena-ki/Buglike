class_name Roaming extends State


var time = 10

func enter():
  print("entered roaming state")


func exit():
  print("exiting roaming state")

func update(delta : float):
  time -= delta
  if time <= 0:
    emit_signal("transition", self, "running")