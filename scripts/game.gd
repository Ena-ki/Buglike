extends Node

@export var camera : Camera2D
@export var death_screen : Control
@export var game_overlay : Control

var players : Array[Player]
@export var boss : Entity # fix


func _ready() -> void:
  for child in get_children():
    if child is Player:
      players.append(child)
  game_overlay.set_players(players)


func _process(_delta):
  if check_players_alive() == false:
    death_screen.visible = true
    process_mode = Node.PROCESS_MODE_DISABLED
  # elif boss.state_machine.current_state.name != "Dead": # change this shit
  #   death_screen.visible = true
  #   process_mode = Node.PROCESS_MODE_DISABLED
      

  var camera_mid_position := Vector2.ZERO
  for player in players:
    camera_mid_position += player.global_position
  camera_mid_position /= players.size()

  camera.position = camera_mid_position
  pass


func check_players_alive() -> bool:
  for player in players:
    if player.current_state.name != "Dead":
      return true
  return false
