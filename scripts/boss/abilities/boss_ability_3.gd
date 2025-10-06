extends Ability

@export var projectile_scene : PackedScene

@export var wave_density := 10.0
@export var time_between_waves := 0.2
@export var wave_amount := 3


func execute(caster):
  for i in range(wave_amount):
    for j in range(wave_density):
      var projectile_instance = projectile_scene.instantiate()
      Globals.game_manager.add_child_current_scene(projectile_instance)
      projectile_instance.direction = (
        Vector2.UP.rotated(deg_to_rad(360 / wave_density * j + (360 / wave_density / 2 * i))) )
      projectile_instance.global_position = caster.global_position
    await get_tree().create_timer(time_between_waves).timeout


func get_cooldown():
  return 2.0