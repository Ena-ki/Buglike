extends Ability

@export var duration_timer : Timer
@export var cooldown_timer : Timer
@export var dodge_speed := 250.0 

var player : Player

# sets caster's state to dodging with a signal
# sets caster's velocity to dodging speed
# after the dodge time runs out
func _ready():
  duration_timer.timeout.connect(on_duration_timer_timeout)


func execute(new_player : Player):
  player = new_player
  if player.velocity == Vector2.ZERO or cooldown_timer.time_left > 0.0:
    return
  player.attributes.can_move = false
  player.attributes.invulnderable = true
  player.velocity = dodge_speed * player.velocity.normalized()
  duration_timer.start()
  cooldown_timer.start()


func on_duration_timer_timeout():
  player.attributes.can_move = true
  player.attributes.invulnderable = false


func get_cooldown():
  return cooldown_timer.time_left / cooldown_timer.wait_time
