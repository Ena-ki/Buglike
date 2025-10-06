class_name Alive extends State


func enter():
  owner.died.connect(on_owner_died)


func exit():
  owner.died.disconnect(on_owner_died)


func update(_delta : float):
  pass


func physics_update(_delta : float):
  pass