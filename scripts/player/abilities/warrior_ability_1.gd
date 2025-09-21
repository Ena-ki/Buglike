extends Node2D

signal ability_finished

@export var hitbox_scene : PackedScene
@export var dash_timer : Timer

# Skill properties
const KNOCKBACK_SPEED = 300.0 #넉백속도
const DASH_DURATION = 0.5 # 스킬 지속시간

var is_dashing = false
var dash_direction = Vector2.ZERO
var player_ref : Player # Store player reference

func _ready():
  # This node's processing is driven by player.gd, not by itself.
  set_physics_process(false)
  if dash_timer:
    dash_timer.timeout.connect(_on_dash_timer_timeout)
  else:
    push_error("Dash Timer node not assigned in warrior_ability_1.gd")


func execute(p_player : Player): # Type hint for clarity
  if p_player.active_movement_ability:
    return
  if not hitbox_scene:
    push_error("Hitbox scene not assigned to warrior ability 1")
    return
  if not dash_timer:
    push_error("Dash Timer not assigned in warrior_ability_1.gd")
    return

  p_player.active_movement_ability = self
  self.player_ref = p_player

  # --- Attack ---
  var hitbox_instance = hitbox_scene.instantiate()
  hitbox_instance.creator = player_ref
  get_tree().current_scene.add_child(hitbox_instance)
  hitbox_instance.global_position = player_ref.global_position + player_ref.facing_direction * 50.0

  # --- Start Movement ---
  is_dashing = true
  dash_direction = -player_ref.facing_direction
  dash_timer.start(DASH_DURATION)
func process_ability(p_player : Player, delta: float):
  if is_dashing:
    p_player.velocity = dash_direction * KNOCKBACK_SPEED

func _on_dash_timer_timeout():
  is_dashing = false
  if is_instance_valid(player_ref):
    emit_signal("ability_finished", player_ref)
