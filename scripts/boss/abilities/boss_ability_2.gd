extends Ability

@export var projectile_scene : PackedScene
@export var player_detection_area : Area2D

@export var damage := 30.0
@export var shot_speed := 100.0
@export var bullet_lifetime := 10.0
@export var time_between_shots := 0.2
@export var shot_amount := 5
@export var projectile_spread := 30.0

var centered_spread : float
var projectile_move_direction : Vector2

func execute(caster : Entity):
  var closest : float
  var closest_body : Node2D

  centered_spread = projectile_spread - projectile_spread / 2

  for body in player_detection_area.get_overlapping_bodies():
    if body == caster or body is not Player or body.current_state.name == "Dead":
      continue
    if not closest or (position - body.position).length() > closest:
      closest = (position - body.position).length()
      closest_body = body
  

  if closest_body:
    for i in range(shot_amount):
      projectile_move_direction = (closest_body.global_position - global_position).normalized()
      var random_spread_angle = randf_range(centered_spread, -centered_spread)
      projectile_move_direction = projectile_move_direction.rotated(deg_to_rad(random_spread_angle))
      print(projectile_move_direction)

      var projectile_instance = projectile_scene.instantiate()
      Globals.game_manager.add_child_current_scene(projectile_instance)

      projectile_instance.init_projectile(
      projectile_move_direction,
      owner.global_position, 
      damage, 
      shot_speed, 
      bullet_lifetime)

      await get_tree().create_timer(time_between_shots).timeout
