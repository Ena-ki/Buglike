extends Entity

@export var abilities : Array[Node2D] = []


func _physics_process(delta: float) -> void:
  move_and_collide(velocity * delta)


