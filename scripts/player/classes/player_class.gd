class_name PlayerClass
extends Node2D

@export var player_class_res : PlayerClassRes
@export_category("player abilities")
@export var movement_ability_scene : PackedScene
@export var ability_1_scene : PackedScene
@export var ability_2_scene : PackedScene
@export var ability_3_scene : PackedScene

var movement_ability
var ability_1
var ability_2
var ability_3

func load_ability(player_class_ref : PlayerClass, ability_scene : PackedScene):
  var ability_instance = ability_scene.instantiate()
  player_class_ref.add_child(ability_instance)
  return ability_instance
