extends Node

@export var player_scene : PackedScene

func _ready() -> void:
  add_child(GameData.level_scene.instantiate())
  for i in range(GameData.player_count):
    var player_instance = player_scene.instantiate() as Player
    player_instance.player_number = i
    player_instance.add_child(GameData.ability_component_scenes[i].instantiate())
    # add level player spawners
    add_child(player_instance)
