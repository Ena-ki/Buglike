class_name Running extends State


var time = 10

func enter():
  print("entered running state")


func exit():
  print("exiting running state")

func update(delta : float):
  time -= delta
  if time <= 0:
    emit_signal("transition", self, "roaming")