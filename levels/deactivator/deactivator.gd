extends Area2D

@export var objects : Array[Node2D] = []
@export var is_activator : bool = false


func _on_body_entered(body: Node2D) -> void:
  if body is not Entity:
    return

  if is_activator:
    for i in range(objects.size()):
      objects[i].call_deferred("set", "process_mode", Node.PROCESS_MODE_INHERIT)
      if objects[i] is TileMapLayer:
        objects[i].enabled = true
  else:
    for i in range(objects.size()):
      objects[i].call_deferred("set", "process_mode", Node.PROCESS_MODE_DISABLED)
      if objects[i] is TileMapLayer:
        objects[i].enabled = false
  call_deferred("set", "process_mode", Node.PROCESS_MODE_DISABLED)
