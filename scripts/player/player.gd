class_name Player extends Entity

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class_scene : PackedScene = preload("res://scenes/player/classes/warrior_player_class.tscn")
@export var state_machine : StateMachine
@export var damage_timer : Timer

var player_class : PlayerClass


func _ready():
  damaged.connect(on_player_damaged)
  died.connect(on_player_died)
  damage_timer.timeout.connect(on_damage_timer_timeout)
  player_class = player_class_scene.instantiate()
  add_child(player_class)  
  
  if not player_class_scene:
    push_error("Player has no player_class_scene assigned!")


func _process(delta):
  if Input.is_action_just_pressed("player_" + str(player_number) + "_dodge"):
    player_class.dodge_ability.execute(self)
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_1"):
    player_class.ability_1.execute(self)
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_2"):
    player_class.ability_2.execute(self)
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_3"):
    player_class.ability_3.execute(self)


func _physics_process(delta: float) -> void:
  if attributes.can_move == true:
    player_class.movement_ability.execute(self)
  move_and_collide(velocity * delta)


func damage(damage : float):
  if attributes.invulnderable == true:
    return
  health -= damage
  emit_signal("damaged", damage)
  if health <= 0:
    emit_signal("died")
  print(health)


func on_player_damaged(damage : float):
  damage_timer.start()
  attributes.invulnderable = true


func on_player_died():
  attributes.can_move = false
  attributes.invulnderable = true
  velocity = Vector2.ZERO


func on_damage_timer_timeout():
  if state_machine.current_state.name != "Dead":
    attributes.invulnderable = false
