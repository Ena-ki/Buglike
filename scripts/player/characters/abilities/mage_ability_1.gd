extends Area2D

# all of this shit is so ass
# it's fine for now, but make it a projectile template
# and give it properties with resources


@export var life_timer : Timer
#should be changed from the player class
var life_time = 2.0
var texture : Texture2D
var damage := 1.0
var projectile_speed := 100.0
var direction := Vector2.UP


func _ready():
  life_timer.timeout.connect(on_timer_timeout)  


func _process(delta: float) -> void:
  position += direction * delta * projectile_speed


func on_timer_timeout() -> void:
  queue_free()