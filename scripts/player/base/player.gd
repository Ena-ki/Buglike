extends CharacterBody2D

@export var player_class : PlayerClass
@export var player_number : PlayerNumber = PlayerNumber.PLAYER_1

var player_input : String


# make it into a singleton
enum PlayerNumber
{
  PLAYER_1,
  PLAYER_2,
  PLAYER_3,
  PLAYER_4,
}


func _ready():
  pass


func _physics_process(delta: float) -> void:
  #finish the input_component class

  velocity *= delta
  


  move_and_slide()