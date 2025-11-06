extends Area2D

@export var progress_bar : ProgressBar
@export var health : HealthComponent
@export var particles : CPUParticles2D
@export var time_to_revive : float = 2.0
@export var invulnderable_timer : float = 2.0
var _bodies_inside : Array[Player] = []
var _progress : float = 0


func _ready() -> void:
  if health:
    health.died.connect(on_health_died)
  set_process(false)
  #visible = false


func _process(delta: float) -> void:
  progress_bar.value = _progress / time_to_revive
  if not _bodies_inside.is_empty():
    for i in range(_bodies_inside.size()):
      if not _bodies_inside[i].health.is_dead:
        _progress += delta
        break
  if _progress >= time_to_revive:
    health.revive(2)
    health.set_invulnderable(invulnderable_timer)
    set_process(false)
    visible = false


func on_health_died():
  particles.restart()
  _progress = 0.0
  visible = true
  set_process(true)


func _on_body_entered(body: Node2D) -> void:
  if body is Player and body != owner:
    _bodies_inside.append(body)


func _on_body_exited(body: Node2D) -> void:
  if body is Player and body != owner:
    _bodies_inside.remove_at(_bodies_inside.find(body))
