@abstract
class_name State extends Node

signal transition(state, new_state_name)


func enter():
  pass


func exit():
  pass


func update(delta : float):
  pass


func physics_update(delta : float):
  pass
