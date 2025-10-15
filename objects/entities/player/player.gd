class_name Player
extends Entity

enum PlayerNumber{
  PLAYER_1 = 1,
  PLAYER_2 = 2,
}

@export var ability_comp : AbilityComponent
@export var player_number : PlayerNumber = PlayerNumber.PLAYER_1


func _process(_delta):
  for i in range(1, 4):
    if Input.is_action_just_pressed(str("player_", player_number, "_ability_", i)):
      ability_comp.abilities[i].execute(self)


func _physics_process(delta: float) -> void:
  ability_comp.abilities[0].execute(self)
  move_and_collide(delta * velocity)
