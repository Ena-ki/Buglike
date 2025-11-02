extends Bullet

@export var explosion_scene : PackedScene


func _exit_tree() -> void:
  var explosion = explosion_scene.instantiate() as DamageArea
  explosion.position = position
  get_tree().current_scene.add_child.call_deferred(explosion)
  