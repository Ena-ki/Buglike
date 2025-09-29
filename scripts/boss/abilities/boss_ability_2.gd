extends Ability

@export var projectile_scene : PackedScene
@export var player_detection_area : Area2D

@export var damage := 30.0
@export var shot_speed := 100.0
@export var bullet_lifetime := 10.0
@export var time_between_shots := 0.2

var projectile_move_direction

func execute(caster : Entity):
  var closest : float
  var closest_body : Node2D

  for body in player_detection_area.get_overlapping_bodies():
    if body != caster and (not closest or (position - body.position).length() > closest):
      closest = (position - body.position).length()
      closest_body = body
  

  if closest_body:
    for i in range(9):
      projectile_move_direction = (closest_body.global_position - global_position).normalized()

      var projectile_instance = projectile_scene.instantiate()
      get_tree().current_scene.call_deferred("add_child", projectile_instance)

      projectile_instance.init_projectile(
      projectile_move_direction,
      owner.global_position, 
      damage, 
      shot_speed, 
      bullet_lifetime)

      await get_tree().create_timer(time_between_shots).timeout
