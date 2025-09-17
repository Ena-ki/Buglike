extends Node

@export var state_machine : StateMachine
# add :
#   main menu state
#   game state
#   paused state
@export var camera : Camera2D
# get player from main menu
var player_1 : Player 
var player_2 : Player


func _process(delta):
  #if state_machine.current_state.name == "Game"
  pass

