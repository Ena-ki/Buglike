class_name Projectile extends Area2D

@export var projectile_res : ProjectileRes 

var direction :
  get:
    return projectile_res.direction
  set(new_direction):
    projectile_res.direction = new_direction

var shot_speed :
  get:
    return projectile_res.shot_speed
  set(new_shot_speed):
    projectile_res.shot_speed = new_shot_speed

var life_time :
  get:
    return projectile_res.life_time
  set(new_life_time):
    projectile_res.life_time = new_life_time

var damage :
  get:
    return projectile_res.damage
  set(new_damage):
    projectile_res.damage = new_damage

var group :
  get:
    return projectile_res.group
  set(new_group):
    projectile_res.group = new_group


func _ready():
  projectile_res = projectile_res.duplicate()


func _process(delta):
  global_position += direction * shot_speed * delta
  life_time -= delta
  if life_time <= 0:
    queue_free()
  handle_bodies_inside(get_overlapping_bodies())


func handle_bodies_inside(bodies : Array[Node2D]): # fix
  if bodies == null:
    return

  for body in bodies:
    if body is TileMapLayer:
      queue_free()
      continue

    if body.attributes.invulnderable == true:
      continue

    for i in group:
      if body.is_in_group(i) :
        body.damage(damage)
        queue_free()
