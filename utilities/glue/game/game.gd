extends Node

@export var player_scene : PackedScene
var _level_instance : Level

func _ready() -> void:
  _level_instance = load(GameData.level_scene_path).instantiate() as Level
  add_child(_level_instance)
  for i in range(GameData.players.size()):
    if GameData.players[i] == false:
      continue

    var player_instance = player_scene.instantiate() as Player
    player_instance.player_number = i + 1
    player_instance.global_position = get_player_spawnpoint(i + 1)
    if GameData.ability_component_paths[i] != "":
      var ability_instance = load(GameData.ability_component_paths[i]).instantiate()
      player_instance.add_child(ability_instance) 
      player_instance.ability_comp = ability_instance
      
    _level_instance.add_child(player_instance)


func get_player_spawnpoint(player_number : Player.PlayerNumber) -> Vector2:
  var out := Vector2.ZERO
  for i in _level_instance.spawners:
    if out == Vector2.ZERO or i.player_number == player_number:
      out = i.global_position
  return out
