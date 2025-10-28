class_name BulletSpawnerComponent
extends Node


func spawn(bullet_scene : PackedScene, caster : Entity, body_pos : Vector2) -> Bullet:
  var bullet_instance = bullet_scene.instantiate()
  bullet_instance.stats.direction = (body_pos - caster.position).normalized()
  bullet_instance.global_position = caster.position
  bullet_instance.stats.groups = caster.get_groups()
  get_tree().current_scene.add_child(bullet_instance)
  return bullet_instance
