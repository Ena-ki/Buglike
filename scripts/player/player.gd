class_name Player extends Entity

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class_scene : PackedScene = preload("res://scenes/player/classes/mage_player_class.tscn")
@export var state_machine : StateMachine

var player_class : PlayerClass
var speed = 100


var facing_direction : Vector2 = Vector2.RIGHT

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
    var current_input_direction = Vector2.ZERO # Use a new variable for raw input

    # Always get input direction for facing, regardless of can_move
    if is_instance_valid(player_class.movement_ability):
      current_input_direction = player_class.movement_ability.execute(speed, self, player_number)
      
      if can_move: # Only apply movement if can_move is true
        velocity = current_input_direction * speed # Apply normal movement
      else:
        # If can_move is false, skills are managing velocity, so ensure normal movement doesn't interfere
        # We don't set velocity here, as skills will handle it.
        pass # Skills will set velocity directly

    # Update facing direction based on input (always)
    if current_input_direction != Vector2.ZERO:
      facing_direction = current_input_direction.normalized()

    # Safely call dodge ability
    if Input.is_action_just_pressed("player_" + str(player_number) + "_dodge"):
      if is_instance_valid(player_class.dodge_ability):
        player_class.dodge_ability.execute(self)

    # Safely call ability 1
    if Input.is_action_just_pressed("player_"+str(player_number)+"_ability_1"):
      if is_instance_valid(player_class.ability_1):
        player_class.ability_1.execute(self)
    
    # Safely call ability 2
    if Input.is_action_just_pressed("player_"+str(player_number)+"_ability_2"):
      if is_instance_valid(player_class.ability_2):
        player_class.ability_2.execute(self)
  move_and_slide()


func damage(damage : float):
  if not is_invunderable:
    health -= damage
    emit_signal("damaged", damage)
    if health <= 0:
      emit_signal("died")
