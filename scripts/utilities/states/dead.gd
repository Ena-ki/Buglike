class_name Dead extends State


func enter():
  owner.attributes.can_move = false
  owner.attributes.invulnderable = true
  owner.velocity = Vector2.ZERO


func exit():
  pass


func update(_delta : float):
  pass


func physics_update(_delta : float):
  pass