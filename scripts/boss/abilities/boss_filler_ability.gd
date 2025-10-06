extends Ability

@export_category("Nodes")
@export var cooldown_timer : Timer
@export var walking_timer : Timer
@export var detection_area : Area2D
@export_category("Stats")
@export var speed := 100.0

var caster : Entity


func _ready():
  walking_timer.timeout.connect(on_walking_timer_timeout)


func execute(new_caster : Entity):
  caster = new_caster
  if cooldown_timer.time_left > 0.0:
    return
  cooldown_timer.start()
  walk_to_enemy(get_closest_enemy())


func on_walking_timer_timeout():
  caster.velocity = Vector2.ZERO


func walk_to_enemy(enemy):
  if enemy:
    var enemy_move_direction = (enemy.position - caster.position).normalized()
    caster.velocity = enemy_move_direction * speed
  else:
    caster.velocity = Vector2(randf()-0.5,randf()-0.5).normalized() * speed
  walking_timer.start()


func get_closest_enemy():
  var bodies = detection_area.get_overlapping_bodies()
  var out : Entity = null
  for body in bodies :
    if body.is_in_group("friendly_entity"):
      if not out or distance_to_caster(body) < distance_to_caster(out):
        out = body
    
  return out


func distance_to_caster(body) -> float :
  return (caster.global_position - body.global_position).length()


func get_cooldown():
  return cooldown_timer.time_left / cooldown_timer.wait_time
