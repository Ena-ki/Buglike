extends CharacterBody2D
class_name Entity

@export var health : HealthComponent
@export var attributes : EntityAttributes

func _physics_process(delta: float) -> void:
  _physics_update(delta)
  if velocity != Vector2.ZERO:
    attributes.last_direction = velocity.normalized()
    
func _physics_update(_delta: float) -> void:
  pass
