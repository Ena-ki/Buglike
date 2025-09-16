extends Node2D

@export var projectile_scene : PackedScene

var wave_density := 10.0
var time_between_waves := 0.4
var wave_amount := 5


func execute() -> float:
  call_deferred("execute_deferred")
  return 3


func execute_deferred():
  for i in range(wave_amount):
    for j in range(wave_density):
      var projectile_instance = projectile_scene.instantiate()
      get_tree().current_scene.add_child(projectile_instance)
      projectile_instance.init_projectile(
      Vector2.UP.rotated(deg_to_rad(360 / wave_density * j + (360 / wave_density / 2 * i))),
      owner.global_position, 
      10, 
      100.0, 
      3.0)  
    await get_tree().create_timer(time_between_waves).timeout
