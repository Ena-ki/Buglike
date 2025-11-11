extends CharacterBody2D
class_name Entity

@export var health : HealthComponent
@export var anims : AnimationComponent
@export var ability_component : AbilityComponent
@export var movement_speed : float = 100.0
@export var sprite : Sprite2D

var legs_occupied : bool = false
var arms_occupied : bool = false
var is_invulnderable : bool :
  set(val):
    health.is_invulnderable = val
  get:
    return health.is_invulnderable
var look_direction : Vector2


func _ready():
  on_ready()
  health.died.connect(on_health_died)
  health.revived.connect(on_health_revived)


func on_ready():
  pass


func on_health_died(): # on this do revive
  on_death()
  is_invulnderable = false
  sprite.material.set_shader_parameter("is_invulnderable", 2)
  set_process(false)
  set_physics_process(false)
  anims.active = false
 

func on_death():
  pass


func on_health_revived():
  sprite.material.set_shader_parameter("is_invulnderable", 0)
  set_process(true)
  set_physics_process(true)
  anims.active = true


func on_revive():
  pass


func _physics_process(delta: float) -> void:
  if velocity.length() > 0.0:
    look_direction = velocity.normalized()
  _physics_update(delta)
  move_and_collide(velocity * delta)


func _physics_update(_delta: float) -> void:
  pass