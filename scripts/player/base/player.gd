extends CharacterBody2D

@export var player_number : Enums.PlayerNumber = Enums.PlayerNumber.PLAYER_1
@export var player_class : PlayerClass
@export var input_component : InputComponent





func _ready():
  pass


func _physics_process(delta: float) -> void:

  velocity *= delta
  


  move_and_slide()