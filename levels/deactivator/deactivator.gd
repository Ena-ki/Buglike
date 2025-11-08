extends Area2D

@export var objects : Array[Node2D] = []


func _on_body_entered(body: Node2D) -> void:
  if body is Entity:
    for i in range(objects.size()):
      objects[i].call_deferred("set", "process_mode", Node.PROCESS_MODE_DISABLED)
  
    call_deferred("set", "process_mode", Node.PROCESS_MODE_DISABLED)
