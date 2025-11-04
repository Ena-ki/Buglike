extends Enemy

@export var anims : AnimationComponent

func _physics_process(delta: float) -> void:
  move_and_collide(velocity * delta)
