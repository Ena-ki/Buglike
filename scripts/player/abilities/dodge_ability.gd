extends Ability

@export var dodge_duration_timer : Timer
@export var dodge_cooldown_timer : Timer
@export var dodge_speed := 250.0 

var player : Player

# sets caster's state to dodging with a signal
# sets caster's velocity to dodging speed
# after the dodge time runs out
func _ready():
  dodge_duration_timer.timeout.connect(on_dodge_duration_timer_timeout)


func execute(player : Player):
  if player.velocity == Vector2.ZERO or dodge_cooldown_timer.time_left > 0.0:
    return
  self.player = player
  player.attributes.can_move = false
  player.attributes.invulnderable = true
  player.velocity = dodge_speed * player.velocity.normalized()
  dodge_duration_timer.start()
  dodge_cooldown_timer.start()


func on_dodge_duration_timer_timeout():
  player.attributes.can_move = true
  player.attributes.invulnderable = false
