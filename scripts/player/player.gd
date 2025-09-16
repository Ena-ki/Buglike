class_name Player extends Entity

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class_scene : PackedScene = preload("res://scenes/player/classes/mage_player_class.tscn")
@export var state_machine : StateMachine

var player_class : PlayerClass
var speed = 100  
var is_invunderable : bool = false

func _ready():
  if player_class_scene:
    player_class = player_class_scene.instantiate()
    add_child(player_class)
  else:
    push_error("Player has no player_class_scene assigned!")

func _physics_process(delta: float) -> void:
  
  if not is_instance_valid(player_class):
    return

  if Input.is_action_just_pressed("ui_accept"):
    damage(20)
    print(health)

  if state_machine.current_state.name != "Died":
    # Safely call movement ability
    if is_instance_valid(player_class.movement_ability):
      player_class.movement_ability.execute(speed, self, player_number)
    
    # Safely call ability 1
    if Input.is_action_just_pressed("player_"+str(player_number)+"_ability_1"):
      if is_instance_valid(player_class.ability_1):
        player_class.ability_1.execute(self) 

  move_and_slide()


func damage(damage : float):
  if not is_invunderable:
    health -= damage
    emit_signal("damaged", damage)
