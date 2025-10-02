extends Ability

signal ability_finished

@export var hitbox_scene : PackedScene
@export var dash_timer : Timer

# Skill properties
const DASH_SPEED = 400.0 # 돌진 속도
const DASH_DURATION = 0.2 # 스킬 지속시간

var is_dashing = false
var dash_direction = Vector2.ZERO
var player_ref : Player # Store player reference

func _ready():
  # This node's processing is driven by player.gd, not by itself.
  set_physics_process(false)
  if dash_timer:
    dash_timer.timeout.connect(_on_dash_timer_timeout)
  else:
    push_error("Dash Timer node not assigned in warrior_ability_2.gd")

func execute(player : Player): # Type hint for clarity
  if player.active_movement_ability:
    return
  if not hitbox_scene:
    push_error("Hitbox scene not assigned to warrior ability 2")
    return
  if not dash_timer:
    push_error("Dash Timer not assigned in warrior_ability_2.gd")
    return

  player.active_movement_ability = self
  self.player_ref = player

  # --- Attack ---
  var hitbox_instance = hitbox_scene.instantiate()
  hitbox_instance.creator = player_ref
  Globals.game_manager.add_child_current_scene(hitbox_instance)
  # Note: The hitbox scene itself should define the wide, semi-circular shape.
  hitbox_instance.global_position = player_ref.global_position + player_ref.facing_direction * 40.0 # Adjust offset as needed

  # --- Start Movement (Forward Dash) ---
  is_dashing = true
  dash_direction = player_ref.facing_direction # Forward direction
  dash_timer.start(DASH_DURATION)
func process_ability(player : Player, _delta: float):
  if is_dashing:
    player.velocity = dash_direction * DASH_SPEED

func _on_dash_timer_timeout():
  is_dashing = false
  if is_instance_valid(player_ref):
    emit_signal("ability_finished", player_ref)


func get_cooldown():
  return 0.0