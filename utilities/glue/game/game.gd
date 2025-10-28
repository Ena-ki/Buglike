extends Node

@export var player_scene : PackedScene
@export var camera : Camera2D
@export var game_overlay : Control

var _level_instance : Level
var players : Array[Player] = [null, null]

func _ready() -> void:
  _add_level(GameData.level_scene_path)
  _add_players()
  game_overlay.set_up(players)


func _process(_delta) -> void:
  camera.global_position = _player_mid_point() - get_viewport().get_visible_rect().size / 2


func _add_level(level_path : String) -> void:
  _level_instance = load(level_path).instantiate() as Level
  add_child(_level_instance)


func _add_players() -> void:
  for i in range(GameData.players_ready.size()):
    if GameData.players_ready[i] == false:
      continue

    var player_instance = player_scene.instantiate() as Player
    player_instance.player_number = i + 1
    player_instance.global_position = get_player_spawnpoint(i + 1)
    _level_instance.add_child(player_instance)

    var ability_instance = load(GameData.ability_component_paths[i]).instantiate()
    player_instance.add_child(ability_instance) 
    player_instance.ability_component = ability_instance

    players[i] = player_instance
      


func get_player_spawnpoint(player_number : Player.PlayerNumber) -> Vector2:
  var out := Vector2.ZERO
  for i in _level_instance.spawners:
    if out == Vector2.ZERO or i.player_number == player_number:
      out = i.global_position
  return out


func _player_mid_point() -> Vector2:
  var out := Vector2.ZERO
  var count := 0
  for player in players:
    if player == null:
      continue
    out += player.global_position
    count += 1
  return out / count
