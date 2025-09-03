extends CharacterBody2D

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class : PlayerClass
@export var input_component : InputComponent


func _ready():
  input_component.set_player_number(Enums.PlayerNumber.PLAYER_1)


func _physics_process(delta: float) -> void:

  var direction = input_component.get_movement_vector()
  velocity = delta * direction * player_class.player_class_res.speed * 10000 # fix this big ass number

  if input_component.is_ability_1_pressed():
    #fix projectile abilities following us
    player_class.use_ability_1()


  move_and_slide()