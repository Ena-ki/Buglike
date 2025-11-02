extends Ability

@export_category("references")
@export var auto_aim : AutoAimComponent
@export var bullet_maker : BulletMaker
@export_category("stats")
@export var damage : int = 1
@export var bullet_speed : float = 100.0
@export var shot_number : int = 3
@export var spread : float = 15.0

var cur_shot_number : int = 0


func _execute(caster : Entity) -> void:
  cur_shot_number = (cur_shot_number + 1) % shot_number

  var closest_body = auto_aim.get_closest_enemy(caster)
  if closest_body != null:

    var start_rotation = spread * cur_shot_number / 2
    for i in range(cur_shot_number + 1):
      pass