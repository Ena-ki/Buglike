class_name Died extends PlayerState

func enter():
  print("died")#debug
  owner.velocity = Vector2.ZERO
  owner.can_move = false
  owner.is_invunderable = true
