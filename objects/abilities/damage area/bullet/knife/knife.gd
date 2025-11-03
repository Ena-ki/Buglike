extends Bullet

@export var sprite : Sprite2D


func update(_delta : float) -> void:
  sprite.rotation_degrees = rad_to_deg(direction.angle()) + 90
  