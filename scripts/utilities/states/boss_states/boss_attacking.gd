class_name BossAttacking extends State


func enter():
  owner.died.connect(on_owner_died)
  emit_signal("transition", self, "BossWandering")


func exit():
  owner.died.disconnect(on_owner_died)


func update(delta : float):
  pass


func physics_update(delta : float):
  pass
