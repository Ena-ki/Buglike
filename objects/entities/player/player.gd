class_name Player
extends Entity

enum PlayerNumber{
  PLAYER_1 = 1,
  PLAYER_2 = 2,
}

@export var i_frame_duration : float = 0.8
@export var anims : AnimationComponent

var player_number : PlayerNumber = PlayerNumber.PLAYER_1


func _process(_delta):
  sprite.material.set_shader_parameter("is_invulnderable", int(is_invulnderable))
  for i in range(1, 5):
    if Input.is_action_just_pressed(str("player_", player_number, "_ability_", i)):
      execute_ability(i)


func _physics_update(_delta: float) -> void:
  execute_ability(0)


func execute_ability(ability_number : int):
  if ability_component.abilities[ability_number]:
    ability_component.abilities[ability_number].execute(self)
  else:
    Debug.log("no ability found")


func _on_health_component_damaged(_damage_amount: int) -> void:
  var uninvul := true
  if is_invulnderable:
    uninvul = false
  is_invulnderable = true
  await get_tree().create_timer(i_frame_duration).timeout
  if uninvul:
    is_invulnderable = false