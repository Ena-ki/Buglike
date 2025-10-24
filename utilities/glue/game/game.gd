extends Node

@export var player_scene : PackedScene
@export var camera : Camera2D

var _level_instance : Level
var players : Array[Player] = [null,null]

func _ready() -> void:
  _add_level(GameData.level_scene_path)
  _add_players()


func _process(_delta) -> void:
  camera.global_position = _player_mid_point()


func _player_mid_point() -> Vector2:
  var out := Vector2.ZERO
  var count := 0
  for player in players:
    if player == null:
      continue
    out += player.global_position
    count += 1

  return out / count
    


func _add_level(level_path : String) -> void:
  _level_instance = load(level_path).instantiate() as Level
  add_child(_level_instance)


func _add_players() -> void:
  for i in range(GameData.players.size()):
    if GameData.players[i] == false:
      continue

    var player_instance = player_scene.instantiate() as Player
    player_instance.player_number = i + 1
    player_instance.global_position = get_player_spawnpoint(i + 1)
    _level_instance.add_child(player_instance)
    players[i] = player_instance

    if GameData.ability_component_paths[i] != "":
      var ability_instance = load(GameData.ability_component_paths[i]).instantiate()
      player_instance.add_child(ability_instance) 
      player_instance.ability_comp = ability_instance

  if players.all(func(o): return o == null):
    Debug.error("somehow there are no players?")
      


func get_player_spawnpoint(player_number : Player.PlayerNumber) -> Vector2:
  var out := Vector2.ZERO
  for i in _level_instance.spawners:
    if out == Vector2.ZERO or i.player_number == player_number:
      out = i.global_position
  return out
