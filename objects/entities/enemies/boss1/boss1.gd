extends Enemy

@export var ability_comp : AbilityComponent



func _physics_update(delta: float) -> void:
  move_and_collide(velocity * delta)
