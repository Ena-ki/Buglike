extends Node

@export var player_scene : PackedScene
@export var camera : Camera2D
@export var game_overlay : Control
@export var death_screen : Control
@export var win_screen : Control

var level : Level
var players : Array[Player] = [null, null]
var _player_count : int = 0
var _died : int  = 0

func _ready() -> void:
  _add_level(GameData.level_scene_path)
  _add_players()
  game_overlay.set_up(players)


func _process(_delta) -> void:
  if _player_count <= _died:
    process_mode = Node.PROCESS_MODE_DISABLED
    death_screen.show() # this is dumb, do this with signals? maybe?
  camera.global_position = _player_mid_point() - get_viewport().get_visible_rect().size / 2


func on_player_died() -> void:
  _died += 1


func on_player_revived() -> void:
  _died -= 1


func _add_level(level_path : String) -> void:
  level = load(level_path).instantiate() as Level
  add_child(level)
  level.beaten.connect(on_level_beaten)


func on_level_beaten():
  await get_tree().create_timer(3).timeout
  call_deferred("set", "process_mode", Node.PROCESS_MODE_DISABLED)
  win_screen.show()


func _add_players() -> void:
  for i in range(GameData.players_ready.size()):
    if GameData.players_ready[i] == false:
      continue

    var player_instance = player_scene.instantiate() as Player
    player_instance.player_number = i + 1
    player_instance.global_position = _get_player_spawnpoint(i + 1)
    level.add_child(player_instance)

    var ability_instance = load(GameData.ability_component_paths[i]).instantiate() as AbilityComponent
    player_instance.add_child(ability_instance)
    ability_instance.owner = player_instance
    player_instance.ability_component = ability_instance

    players[i] = player_instance
  
  for i in range(players.size()):
    if players[i] != null:
      _player_count += 1
      players[i].health.died.connect(on_player_died)
      players[i].health.revived.connect(on_player_revived)


func _get_player_spawnpoint(player_number : Player.PlayerNumber) -> Vector2:
  var out := Vector2.ZERO
  for i in level.player_spawners:
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


func tp_all(pos : Vector2):
  for i in (players.size()):
    if players[i] != null:
      players[i].position = pos
