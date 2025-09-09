extends CharacterBody2D

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class : PlayerClass


func _physics_process(delta: float) -> void:
  if player_class.is_alive:
    player_class.movement_ability.execute_ability(1000, self, player_number)
  
  if Input.is_action_just_pressed("player_"+str(player_number)+"_ability_1"):
    player_class.ability_1.execute_ability()
  
  if Input.is_action_just_pressed("ui_accept"):
    player_class.get_damaged(20)

  move_and_slide()
