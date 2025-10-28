class_name Bullet
extends Area2D

signal hit()

@export var stats : BulletStats
@export var body_check_time : float = 0.3
var body_check_timer : float = 0.3


func _ready():
  stats = stats.duplicate()
  body_entered.connect(on_bullet_body_entered)


func _process(delta):
  if stats.lifetime <= 0:
    queue_free()

  if body_check_timer <= 0:
    body_check_timer = body_check_time
    if has_overlapping_bodies():
      var bodies = get_overlapping_bodies()
      for body in bodies :
        if body is Entity:
          emit_signal("hit")
          damage_entity(body)

  global_position += stats.direction * stats.speed * delta
  stats.lifetime -= delta
  body_check_timer -= delta


func on_bullet_body_entered(body : Node2D):
  damage_entity(body)


func damage_entity(body):
  if body is not Entity:
    return

  if check_body_in_group(body, stats.groups) == false :
    return

  if body.health == null or body.health.is_dead:
    return


  body.health.damage(stats.damage)
  queue_free()


func check_body_in_group(body : Entity, groups : Array[String]) -> bool:
  for i in groups:
    if body.is_in_group(i):
      return true
  return false
