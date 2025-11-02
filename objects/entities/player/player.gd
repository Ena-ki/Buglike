class_name Player
extends Entity

enum PlayerNumber{
  PLAYER_1 = 1,
  PLAYER_2 = 2,
}

@export var health_component : HealthComponent

var player_number : PlayerNumber = PlayerNumber.PLAYER_1
var ability_component

func _process(_delta):
  for i in range(1, 5):
    if Input.is_action_just_pressed(str("player_", player_number, "_ability_", i)):
      execute_ability(i)


func _physics_update(_delta: float) -> void:
  execute_ability(0)


func execute_ability(ability_number : int):
  if ability_component:
    ability_component.abilities[ability_number].execute(self)
  else:
    Debug.log("no ability found")
