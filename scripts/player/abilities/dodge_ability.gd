extends Node2D

signal ability_finished

@export var dodge_timer : Timer
@export var dodge_speed := 400.0 # Increased speed for a better feel

const DODGE_DURATION = 0.3 # 구르기 지속시간

var player : Player
var dodge_direction : Vector2

func _ready():
  dodge_timer.timeout.connect(on_dodge_timer_timeout)

func execute(p_player : Player):
  # Don't execute if another movement ability is already active
  if p_player.active_movement_ability:
    return
  
  # Set this ability as the active one
  p_player.active_movement_ability = self
  self.player = p_player
  
  player.is_invunderable = true
  dodge_direction = player.facing_direction # Dodge in the direction the player is facing
  dodge_timer.start(DODGE_DURATION)
# This function is called by player.gd every physics frame while this is the active ability
func process_ability(p_player : Player, delta: float):
  p_player.velocity = dodge_direction * dodge_speed

func on_dodge_timer_timeout():
  if player: # Ensure player is valid
    emit_signal("ability_finished", player)
