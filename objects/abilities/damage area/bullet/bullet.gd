class_name Bullet
extends DamageArea

var direction := Vector2.ZERO
var speed : float = 100.0
var lifetime : float = 3.0


func update(_delta : float) -> void:
  pass


func _process(delta : float) -> void:
  position += direction * delta * speed
  lifetime -= delta
  if lifetime <= 0:
    _die()
  update(delta)


func _on_hit(_body : Entity) -> void:
  _die()


func _extra_checks(body : Node2D) -> bool:
  if body is TileMapLayer:
    _die()
  return true


func _die():

  Debug.log("yes")
  queue_free()