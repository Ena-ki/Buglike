@abstract
class_name Projectile extends Area2D

var direction : Vector2 = Vector2.ZERO
var speed : float = 1.0
var life_time : float = 10.0
var damage : float = 10.0


func init_projectile(direction : Vector2, global_position : Vector2,  damage : float, speed : float, life_time : float,):
    self.direction = direction
    self.global_position = global_position
    self.speed = speed
    self.life_time = life_time
    self.damage = damage


func _process(delta):
    position += direction * speed * delta
    life_time -= delta
    if life_time <= 0:
        queue_free()
    

    
