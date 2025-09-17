@abstract
class_name Entity extends CharacterBody2D

#stats
var health : float = 100

signal damaged(damage)
signal died()


func damage(damage : float):
  health -= damage