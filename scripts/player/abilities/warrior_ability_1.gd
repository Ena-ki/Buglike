extends Node2D

@export var hitbox_scene : PackedScene

# Skill properties
const ATTACK_OFFSET = 50.0
const KNOCKBACK_SPEED = 300.0#넉속도
const KNOCKBACK_DURATION = 0.5#넉백지속시간

var is_dashing = false
var dash_timer = 0.0
var dash_direction = Vector2.ZERO
var player_ref : Player # Store player reference

func _ready():
  set_physics_process(true)

func _physics_process(delta):
  if is_dashing:
    if dash_timer > 0:
      player_ref.velocity = dash_direction * KNOCKBACK_SPEED
      dash_timer -= delta
    else:
      is_dashing = false
      player_ref.velocity = Vector2.ZERO # Stop movement after dash
      player_ref.can_move = true # Re-enable player movement

func execute(p_ref : Player): # Type hint for clarity
  if not hitbox_scene:
    push_error("Hitbox scene not assigned to warrior ability 1")
    return

  self.player_ref = p_ref # Store player reference
  player_ref.can_move = false # Disable player movement during knockback

  # --- Attack ---
  var hitbox_instance = hitbox_scene.instantiate()
  hitbox_instance.creator = p_ref
  get_tree().current_scene.add_child(hitbox_instance)
  hitbox_instance.global_position = p_ref.global_position + p_ref.facing_direction * ATTACK_OFFSET

  # --- Start Movement ---
  is_dashing = true
  dash_timer = KNOCKBACK_DURATION
  dash_direction = -p_ref.facing_direction
