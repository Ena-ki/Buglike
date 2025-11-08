extends Node2D

@export var shoot_dir := Vector2.UP
@export var bullet_scene : PackedScene
@export var bullet_interval : float = 0.5
@export var bullet_speed : float = 100.0

var _bullet_timer : float = 0.5

func _process(delta):
  _bullet_timer -= delta
  if _bullet_timer <= 0:
    _bullet_timer += bullet_interval
    
    var bullet = bullet_scene.instantiate() as Bullet
    bullet.position = position
    bullet.direction = shoot_dir.normalized()
    bullet.add_to_groups(get_groups())
    bullet.speed = bullet_speed
    bullet.lifetime = 10 
    get_tree().current_scene.level.add_child(bullet)
