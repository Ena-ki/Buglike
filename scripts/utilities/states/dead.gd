class_name Dead extends State


func enter():
  owner.velocity = Vector2.ZERO
  owner.attributes.can_move = false
  owner.attributes.invulnderable = true


func exit():
  pass


func update(delta : float):
  pass


func physics_update(delta : float):
  pass