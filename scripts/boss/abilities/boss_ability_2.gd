extends Ability

@export_category("references")
@export var projectile_scene : PackedScene
@export var player_detection_area : Area2D
@export_category("stats")
@export var time_between_shots := 0.2
@export var shot_amount := 5
@export var projectile_spread := 30.0

var centered_spread : float
var projectile_move_direction : Vector2

func execute(caster : Entity):
  var closest_body : Node2D

  centered_spread = projectile_spread - projectile_spread / 2

  closest_body = get_closest_body(caster, player_detection_area.get_overlapping_bodies())
  

  if closest_body:
    for i in range(shot_amount):
      projectile_move_direction = (closest_body.global_position - global_position).normalized()
      var random_spread_angle = randf_range(centered_spread, -centered_spread)
      projectile_move_direction = projectile_move_direction.rotated(deg_to_rad(random_spread_angle))

      var projectile_instance = projectile_scene.instantiate()
      Globals.game_manager.add_child_current_scene(projectile_instance)
      projectile_instance.global_position = caster.global_position
      projectile_instance.direction = projectile_move_direction

      await get_tree().create_timer(time_between_shots).timeout





func get_cooldown():
  return 2.0
