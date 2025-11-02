extends DamageArea

@export var sprite : Sprite2D
@export var explosion_duration : float = 0.7

var _tagged_entities : Array[Entity] = []


func _process(delta):
  explosion_duration -= delta
  if explosion_duration <= 0:
    queue_free()
  sprite.rotation += delta * 15


func _extra_checks(body) -> bool:
  for i in range(_tagged_entities.size()):
    if _tagged_entities[i] == body:
      return false
  return true


func _on_hit(body: Entity) -> void:
  _tagged_entities.append(body)
