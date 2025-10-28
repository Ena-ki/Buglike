class_name Bullet
extends Area2D

signal hit()

@export var stats : BulletStats
@export var body_check_time : float = 0.3
var _body_check_time_left : float = 0.3


func _ready():
  stats = stats.duplicate()
  body_entered.connect(on_bullet_body_entered)


func _process(delta):
  if stats.lifetime <= 0:
    queue_free()

  if _body_check_time_left <= 0:
    _body_check_time_left = body_check_time
    if has_overlapping_bodies():
      var bodies = get_overlapping_bodies()
      for body in bodies :
        if body is Entity:
          emit_signal("hit")
          damage_entity(body)

  position += stats.direction * stats.speed * delta
  stats.lifetime -= delta
  _body_check_time_left -= delta


func on_bullet_body_entered(body : Node2D):
  damage_entity(body)


func damage_entity(body):
  if body is not Entity:
    return

  if check_body_in_group(body, stats.groups) == true :
    return

  if body.health == null or body.health.is_dead or body.health.is_invulnderable:
    return

  body.health.damage(stats.damage)
  queue_free()


func check_body_in_group(body : Entity, groups : Array[StringName]) -> bool:
  for i in groups:
    if body.is_in_group(i):
      return true
  return false
