extends Ability

@export_category("references")
@export var enemy_detection_area : Area2D
@export var projectile_scene : PackedScene
@export var cooldown_timer : Timer


func execute(caster):
  if cooldown_timer.time_left > 0:
    return
  cooldown_timer.start()

  var closest_body = get_closest_body(caster, enemy_detection_area.get_overlapping_bodies())
  
  if closest_body:
    var projectile_instance = projectile_scene.instantiate()
    Globals.game_manager.add_child_current_scene(projectile_instance)

    var shoot_direction = (closest_body.global_position - global_position).normalized()
    projectile_instance.direction = shoot_direction
    projectile_instance.global_position = caster.global_position


func get_cooldown():
  return cooldown_timer.time_left / cooldown_timer.wait_time
