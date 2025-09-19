extends Node2D

@export var hitbox_scene : PackedScene

# Skill properties
const DASH_SPEED = 400.0 # 돌진 속도
const DASH_DURATION = 0.2 # 돌진 지속 시간

var is_dashing = false
var dash_timer = 0.0
var dash_direction = Vector2.ZERO
var player_ref : Player # Store player reference

func _ready():
  set_physics_process(true)

func _physics_process(delta):
  if is_dashing:
    if dash_timer > 0:
      player_ref.velocity = dash_direction * DASH_SPEED
      dash_timer -= delta
    else:
      is_dashing = false
      player_ref.velocity = Vector2.ZERO # Stop movement after dash
      player_ref.can_move = true # Re-enable player movement

func execute(p_ref : Player): # Type hint for clarity
  if not hitbox_scene:
    push_error("Hitbox scene not assigned to warrior ability 2")
    return

  self.player_ref = p_ref # Store player reference
  player_ref.can_move = false # Disable player movement during dash

  # --- Attack ---
  var hitbox_instance = hitbox_scene.instantiate()
  hitbox_instance.creator = p_ref
  get_tree().current_scene.add_child(hitbox_instance)
  # Note: The hitbox scene itself should define the wide, semi-circular shape.
  hitbox_instance.global_position = p_ref.global_position + p_ref.facing_direction * 40.0 # Adjust offset as needed

  # --- Start Movement (Forward Dash) ---
  is_dashing = true
  dash_timer = DASH_DURATION
  dash_direction = p_ref.facing_direction # Forward direction
