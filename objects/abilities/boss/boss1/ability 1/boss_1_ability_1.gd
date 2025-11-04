extends Ability

@export var bullet_speed : float = 100.0
@export var bullet_scene : PackedScene
@export var bullets_in_wave : int = 100

var _bullets : Array[Bullet] = []
var _POOL_SIZE := 100
var _bullets_pointer : int = 0
var groups_set : bool = false


func _ready() -> void:
  _bullets.resize(_POOL_SIZE)
  var yes = get_tree().current_scene
  for i in range(_POOL_SIZE):
    _bullets[i] = bullet_scene.instantiate()
    _bullets[i].speed = bullet_speed
    _bullets[i]._die()
    yes.add_child(_bullets[i])


func _pull_from_pool(caster_pos : Vector2) -> Bullet:
  var bullet := _bullets[_bullets_pointer]
  bullet.position = caster_pos
  bullet.set_process(true)
  bullet.show()
  if _bullets_pointer < _POOL_SIZE-1:
    _bullets_pointer += 1 
  else:
    _bullets_pointer = 0
  return bullet


func _execute(caster : Entity) -> void:
  if groups_set == false:
    var bullet_groups = caster.get_groups()
    for i in range(_bullets.size()):
      _bullets[i].groups = bullet_groups
    groups_set = true
  var spread_angle = 360.0 / bullets_in_wave
  for i in range(bullets_in_wave):
    var bullet_dir = Vector2.UP.rotated(deg_to_rad(spread_angle * i))
    var bullet = _pull_from_pool(caster.position)
    bullet.direction = bullet_dir
    bullet.lifetime = 3
