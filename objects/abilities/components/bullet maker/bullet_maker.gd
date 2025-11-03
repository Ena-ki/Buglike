class_name BulletMaker
extends Node

@export var bullet_scene : PackedScene


func make_bullet(caster : Entity, direction : Vector2):
  var bullet = bullet_scene.instantiate() as Bullet
  bullet.global_position = caster.global_position
  bullet.direction = direction.normalized()
  bullet.groups = caster.get_groups()
  get_tree().current_scene.add_child(bullet)
  return bullet