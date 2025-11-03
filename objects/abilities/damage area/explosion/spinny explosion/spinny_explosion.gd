extends Explosion

@export var sprite : Sprite2D


func update(delta : float) -> void:
  sprite.rotation += 15 * delta
