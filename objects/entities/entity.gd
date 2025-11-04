extends CharacterBody2D
class_name Entity

@export var health : HealthComponent
@export var movement_speed : float = 100.0
@export var ability_component : AbilityComponent
var legs_occupied : bool = false
var arms_occupied : bool = false
var is_invulnderable : bool = false
var look_direction : Vector2


func _physics_process(delta: float) -> void:
  if velocity.length() > 0.0:
    look_direction = velocity.normalized()
  _physics_update(delta)
  move_and_collide(velocity * delta)


func _physics_update(_delta: float) -> void:
  pass