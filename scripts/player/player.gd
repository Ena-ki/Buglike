class_name Player extends Entity

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class_scene : PackedScene = preload("res://scenes/player/classes/warrior_player_class.tscn")
@export var state_machine : StateMachine

var player_class : PlayerClass
var speed = 100
var active_movement_ability = null
var buffered_action : String = "" # For input buffering

var facing_direction : Vector2 = Vector2.RIGHT

func _ready():
  if player_class_scene:
    player_class = player_class_scene.instantiate()
    add_child(player_class)
    if is_instance_valid(player_class.dodge_ability):
      player_class.dodge_ability.ability_finished.connect(_on_ability_finished)
    if is_instance_valid(player_class.ability_1):
      player_class.ability_1.ability_finished.connect(_on_ability_finished)
    if is_instance_valid(player_class.ability_2):
      player_class.ability_2.ability_finished.connect(_on_ability_finished)
  else:
    push_error("Player has no player_class_scene assigned!")

func _physics_process(delta: float) -> void:
  if not is_instance_valid(player_class) or state_machine.current_state.name == "Died":
    return

  # --- Always get input for facing direction ---
  var input_direction = Vector2.ZERO
  if is_instance_valid(player_class.movement_ability):
    # This function returns the raw input direction vector.
    input_direction = player_class.movement_ability.execute(speed, self, player_number)

  # Always update facing direction based on input, even during skills.
  if input_direction != Vector2.ZERO:
    facing_direction = input_direction.normalized()

  # --- Handle Action Input ---
  var dodge_pressed = Input.is_action_just_pressed("player_"+str(player_number)+"_dodge")
  var ability1_pressed = Input.is_action_just_pressed("player_"+str(player_number)+"_ability_1")
  var ability2_pressed = Input.is_action_just_pressed("player_"+str(player_number)+"_ability_2")

  # --- State Logic ---
  if active_movement_ability:
    # If an ability is active, let it process and check for buffered input
    active_movement_ability.process_ability(self, delta)
    
    if dodge_pressed:
      buffered_action = "dodge"
    elif ability1_pressed:
      buffered_action = "ability_1"
    elif ability2_pressed:
      buffered_action = "ability_2"
  else:
    # --- No ability is active ---
    var action_to_execute = ""
    
    if buffered_action:
      action_to_execute = buffered_action
      buffered_action = "" # Clear buffer
    elif dodge_pressed:
      action_to_execute = "dodge"
    elif ability1_pressed:
      action_to_execute = "ability_1"
    elif ability2_pressed:
      action_to_execute = "ability_2"
    
    if action_to_execute:
      execute_action(action_to_execute)
    else:
      # --- NORMAL MOVEMENT ---
      # We already got input_direction from the top of the function.
      velocity = input_direction * speed
      
  move_and_slide()


func execute_action(action_name: String):
  match action_name:
    "dodge":
      if is_instance_valid(player_class.dodge_ability):
        player_class.dodge_ability.execute(self)
    "ability_1":
      if is_instance_valid(player_class.ability_1):
        player_class.ability_1.execute(self)
    "ability_2":
      if is_instance_valid(player_class.ability_2):
        player_class.ability_2.execute(self)


func _on_ability_finished(p_player):
  if p_player != self:
    return
  
  # Generic cleanup for any movement ability
  is_invunderable = false # Assuming all movement skills grant invulnerability
  velocity = Vector2.ZERO
  active_movement_ability = null


func damage(damage : float):
  if not is_invunderable:
    health -= damage
    emit_signal("damaged", damage)
    if health <= 0:
      emit_signal("died")
