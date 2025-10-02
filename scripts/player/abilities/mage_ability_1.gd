extends Ability

@export_category("references")
@export var enemy_detection_area : Area2D
@export var projectile_scene : PackedScene
@export var cooldown_timer : Timer

@export_category("stats")
@export var damage := 30.0
@export var shot_speed := 100.0
@export var bullet_lifetime := 10.0

var move_direction : Vector2

func execute(_caster):
  if cooldown_timer.time_left > 0:
    return
  cooldown_timer.start()

  var closest : float
  var closest_body : Node2D

  for body in enemy_detection_area.get_overlapping_bodies():
    if body is not Player and (not closest or (position - body.position).length() > closest):
      closest = (position - body.position).length()
      closest_body = body
  
  if closest_body:
    move_direction = (closest_body.global_position - global_position).normalized()
    var projectile_instance = projectile_scene.instantiate()
    Globals.game_manager.add_child_current_scene(projectile_instance)
    projectile_instance.init_projectile(
    move_direction,
    owner.global_position, 
    damage, 
    shot_speed, 
    bullet_lifetime)  
    print(global_position)
    print(closest_body.global_position)


func get_cooldown():
  return cooldown_timer.time_left / cooldown_timer.wait_time