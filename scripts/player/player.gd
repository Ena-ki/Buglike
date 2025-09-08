extends CharacterBody2D

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class : PlayerClass




func _physics_process(delta: float) -> void:
  player_class.movement_ability.execute_ability(1000, self, 1)
  
  if Input.is_action_just_pressed("player_1_ability_1"):
    player_class.ability_1.execute_ability()
  move_and_slide()
