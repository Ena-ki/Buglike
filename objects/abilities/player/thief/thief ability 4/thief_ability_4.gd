extends Ability

@export var bullet_maker : BulletMaker
@export var bullet_speed : float = 200.0
@export var bullet_lifetime : float = 2.0
@export var explosion_damage : int = 2


func _execute(caster : Entity) -> void:
  for i in range(4):
    var bullet = bullet_maker.make_bullet(caster, Vector2.UP.rotated(deg_to_rad(90 * i + 45)))
    bullet.lifetime = bullet_lifetime
    bullet.speed = bullet_speed
    bullet.explosion_damage = explosion_damage
    
