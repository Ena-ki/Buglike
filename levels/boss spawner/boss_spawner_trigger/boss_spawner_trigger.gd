extends Area2D

@export var boss_spawner : BossSpawner


func _on_body_entered(body: Node2D) -> void:
  if body is Player:
    boss_spawner.call_deferred("spawn")
    get_tree().current_scene.tp_all(body.position)
    call_deferred("set", "process_mode", Node.PROCESS_MODE_DISABLED)
