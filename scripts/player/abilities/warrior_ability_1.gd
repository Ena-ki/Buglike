extends Ability

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
  dash_timer.timeout.connect(_on_dash_timer_timeout)


func execute(player : Player):
  self.process_mode = Node.PROCESS_MODE_ALWAYS

  if not player.current_state.name == "Dead":
    return
  if not hitbox_scene:
    push_error("Hitbox scene not assigned to warrior ability 1")
    return
  if not dash_timer:
    push_error("Dash Timer not assigned in warrior_ability_1.gd")
    return

  player.active_movement_ability = self
  self.player_ref = player

  # --- Attack ---
  var hitbox_instance = hitbox_scene.instantiate()
  hitbox_instance.creator = player_ref
  Globals.game_manager.add_child_current_scene(hitbox_instance)
  hitbox_instance.global_position = player_ref.global_position + player_ref.facing_direction * 50.0

  # --- Start Movement ---
  is_dashing = true
  dash_direction = -player_ref.facing_direction
  dash_timer.start(DASH_DURATION)




func process_ability(player : Player, delta: float):
  if is_dashing:
    player.velocity = dash_direction * KNOCKBACK_SPEED


func _on_dash_timer_timeout():
  is_dashing = false
  if is_instance_valid(player_ref):
    emit_signal("ability_finished", player_ref)
