class_name Explosion
extends DamageArea

@export var explosion_duration : float = 0.7

var _tagged_entities : Array[Entity] = []


func update(_delta : float) -> void:
  pass


func _process(delta):
  explosion_duration -= delta
  if explosion_duration <= 0:
    queue_free()
  update(delta)


func _extra_checks(body : Node2D) -> bool:
  for i in range(_tagged_entities.size()):
    if _tagged_entities[i] == body:
      return false
  return true


func _on_hit(body: Entity) -> void:
  _tagged_entities.append(body)
