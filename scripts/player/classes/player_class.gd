class_name PlayerClass
extends Node2D

@export_category("player abilities")
@export var movement_ability_scene : PackedScene
@export var ability_1_scene : PackedScene
@export var ability_2_scene : PackedScene
@export var ability_3_scene : PackedScene
@export_category("nodes")
@export var state_machine : StateMachine

signal damaged

var movement_ability
var ability_1
var ability_2
var ability_3

var is_alive : bool = true
var health : int = 100


func load_ability(player_class_ref : PlayerClass, ability_scene : PackedScene):
  var ability_instance = ability_scene.instantiate()
  player_class_ref.add_child(ability_instance)
  return ability_instance


func get_damaged(damage : int):
  health -= damage
  emit_signal("damaged")
