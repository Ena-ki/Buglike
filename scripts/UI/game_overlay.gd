extends Control

var player_count := 1

@export var player_1_tray : Control
@export var player_2_tray : Control

var players : Array[Player] : set = set_players


func _ready():
  await owner.ready 
  for player in players:
    if player.player_number == 1:
      if player_1_tray.player:
        push_error("game_overlay.gd: cannot assign player 1")
      player_1_tray.player = player
    
    elif player.player_number == 2:
      if player_2_tray.player:
        push_error("game_overlay.gd: cannot assign player 2")
      player_2_tray.player = player

  player_1_tray.set_up()
  player_2_tray.set_up()
    


func set_players(new_players : Array[Player]) -> void:
  players = new_players
