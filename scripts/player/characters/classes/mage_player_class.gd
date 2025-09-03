extends PlayerClass

@export var player_class_animated_sprite2D : AnimatedSprite2D 



func _ready():
  player_class_animated_sprite2D.sprite_frames = player_class_res.player_class_sprite_frames


func use_ability_1() -> bool:
  
  var ability_1_instance = player_class_res.ability_1_scene.instantiate()
  get_tree().current_scene.add_child(ability_1_instance)
  ability_1_instance.global_position = global_position
  ability_1_instance.direction = Vector2.UP
  return true


func use_ability_2() -> bool:
  return true


func use_ability_3() -> bool:
  return true


func use_ability_4() -> bool:
  return true
