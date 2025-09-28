class_name PlayerClass extends Node2D

@export_category("player abilities")
@export var movement_ability : Node2D
@export var dodge_ability : Node2D 
@export var ability_1 : Node2D
@export var ability_2 : Node2D
@export var ability_3 : Node2D
@export_category("stats")
@export var movement_speed : float = 100.0


func _ready():
  if not movement_ability : push_warning("no movement ability assigned")
  if not dodge_ability : push_warning("no dodge assigned")
  if not ability_1 : push_warning("no ability 1 assigned")
  if not ability_2 : push_warning("no ability 2 assigned")
  if not ability_3 : push_warning("no ability 3 assigned")