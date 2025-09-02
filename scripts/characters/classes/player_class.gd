class_name PlayerClass
extends Node

@export var player_class_res : PlayerClassRes

var ability_1_cooldown := 0.0
var ability_2_cooldown := 0.0
var ability_3_cooldown := 0.0
var ability_4_cooldown := 0.0

func use_ability_1() -> bool:
  return true


func use_ability_2() -> bool:
  return true


func use_ability_3() -> bool:
  return true


func use_ability_4() -> bool:
  return true
