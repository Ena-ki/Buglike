class_name BossSpawner
extends Node2D

signal boss_beaten

@export var boss_scene : PackedScene


func spawn():
  if not boss_scene:
    Debug.error("no boss scene in boss spawners")
    return
  var boss_instance = boss_scene.instantiate() as Enemy
  owner.add_child(boss_instance)
  boss_instance.position = position
  boss_instance.health.died.connect(on_boss_died)


func on_boss_died():
  Debug.log("boss beaten")
  emit_signal("boss_beaten")
