class_name Player extends Entity

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class : PlayerClass
@export var state_machine : StateMachine

var speed = 100  
var is_invunderable : bool = false

func _physics_process(delta: float) -> void:
  
  if Input.is_action_just_pressed("ui_accept"):
    damage(20)
    print(health)

  if state_machine.current_state.name != "Died":
    player_class.movement_ability.execute(speed, self, player_number)
    
    if Input.is_action_just_pressed("player_"+str(player_number)+"_ability_1"):
      player_class.ability_1.execute() 

  move_and_slide()


func damage(damage : float):
  if not is_invunderable:
    health -= damage
    emit_signal("damaged", damage)

