extends Node2D

@export var dodge_timer : Timer
@export var dodge_distance := 100.0
@export var dodge_speed := 200.0
var current_distance := 0.0
var player : Player


#make a point in space and move player towards that point ,time varies on speed
func _ready():
  dodge_timer.timeout.connect(on_dodge_timer_timeout)


func execute(player : Player):
  player.can_move = false
  player.is_invunderable = true
  player.velocity = player.velocity.normalized() * dodge_speed
  self.player = player
  dodge_timer.start()


func on_dodge_timer_timeout():
  player.can_move = true
  player.is_invunderable = false
