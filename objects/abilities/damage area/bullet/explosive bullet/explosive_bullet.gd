extends Bullet

@export var explosion_scene : PackedScene
@export var explosion_damage : int = 1


func _exit_tree() -> void:
  var explosion = explosion_scene.instantiate() as DamageArea
  explosion.position = position
  explosion.damage = explosion_damage
  get_tree().current_scene.add_child.call_deferred(explosion)
  