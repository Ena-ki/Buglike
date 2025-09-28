@abstract
class_name State extends Node

signal transition(state, new_state_name)


@abstract func enter()
@abstract func exit()
@abstract func update(delta : float)
@abstract func physics_update(delta : float)


func on_owner_died():
  emit_signal("transition", self, "Dead")