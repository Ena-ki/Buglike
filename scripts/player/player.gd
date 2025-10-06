class_name Player extends Entity

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class_scene : PackedScene = preload("res://scenes/player/classes/warrior_player_class.tscn")
@export var state_machine : StateMachine
@export var damage_timer : Timer

var player_class : PlayerClass
var current_state : State: 
  get: return state_machine.current_state

func _ready():
  set_up_resources()
  damaged.connect(on_player_damaged)
  damage_timer.timeout.connect(on_damage_timer_timeout)
  player_class = player_class_scene.instantiate()
  add_child(player_class)
  player_class.set_up(self)


func _process(_delta):
  handle_abilities()


func _physics_process(delta: float) -> void:
  if attributes.can_move == true:
    player_class.movement_ability.execute(self)
  move_and_collide(velocity * delta)


func handle_abilities():
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_1"):
    player_class.ability_1.execute(self)
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_2"):
    player_class.ability_2.execute(self)
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_3"):
    player_class.ability_3.execute(self)
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_4"):
    player_class.ability_4.execute(self)


func damage(damage_dealt : float):
  if attributes.invulnderable == true:
    return
  health -= damage_dealt
  emit_signal("damaged", damage_dealt)
  if health <= 0:
    emit_signal("died")
  print(health)


func on_player_damaged(_damage_dealt : float):
  damage_timer.start()
  attributes.invulnderable = true


func on_damage_timer_timeout():
  if current_state.name != "Dead":
    attributes.invulnderable = false
