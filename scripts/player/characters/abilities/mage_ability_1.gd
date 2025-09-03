extends Ability
class_name MageAbility1

#projectile should be a component 

@export var projectile : Projectile

var projectile_speed : float = 1.0
var direction : Vector2 = Vector2.ZERO


func _ready():
  projectile.body_entered.connect(on_projectile_body_entered)


func _process(delta):
  position += direction * projectile_speed * delta * 1000 # magic ass number


func on_projectile_body_entered(body : Node2D):
  pass
