class_name Bullet
extends DamageArea

var direction := Vector2.ZERO
var speed : float = 100.0
var lifetime : float = 1.0


func _process(delta) -> void:
  position += direction * delta * speed
  lifetime -= delta
  if lifetime <= 0:
    queue_free()


func _on_hit(_body : Entity) -> void:
  queue_free()


func _extra_checks(body : Node2D) -> bool:
  if body is TileMapLayer:
    queue_free()
  return true
