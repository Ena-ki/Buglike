extends Ability

@export_category("references")
@export var auto_aim : AutoAimComponent
@export var bullet_spawner : BulletSpawnerComponent
@export var bullet_scene : PackedScene
@export_category("stats")
@export var damage : int = 1
@export var bullet_speed : float = 100.0


func _execute(caster : Entity):
  var closest_body = auto_aim.get_closest_enemy(caster)
  var bullet : Bullet = null

  if closest_body != null:
    bullet = bullet_spawner.spawn(bullet_scene, caster, closest_body.position)
  
  bullet.stats.speed = bullet_speed
  bullet.stats.damage = damage
    
