class_name BossWandering extends State

@export var wander_cooldown := 1.5
@export var wander_stop_time := 1.0
@export var wander_speed := 20.0
var wander_timer := 0.0
var wander_direction := Vector2.ZERO


func enter():
  owner.died.connect(on_owner_died)
  wander_timer = wander_cooldown
  wander_direction = Vector2(randf()-0.5,randf()-0.5).normalized()
  owner.velocity = wander_direction * wander_speed


func exit():
  owner.died.disconnect(on_owner_died)


func update(delta : float):
  if wander_timer <= 0.0:
    emit_signal("transition", self, "BossAttacking")
  elif owner.velocity != Vector2.ZERO and wander_timer < wander_cooldown - wander_stop_time:
    owner.velocity = Vector2.ZERO
  else:
    wander_timer  -= delta


func physics_update(delta : float):
  pass
  