extends Bullet

@export var explosion_scene : PackedScene
@export var explosion_damage : int = 1


func update(delta : float) -> void:
  speed = lerp(speed, 0.0, delta * 3)


func _exit_tree() -> void:
  var explosion = explosion_scene.instantiate() as DamageArea
  explosion.position = position
  explosion.damage = explosion_damage
  get_tree().current_scene.level.add_child.call_deferred(explosion)
  
