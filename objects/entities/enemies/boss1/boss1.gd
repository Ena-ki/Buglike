extends Enemy

@export var bar : ProgressBar

func _physics_process(delta: float) -> void:
  move_and_collide(velocity * delta)


func update(_delta) -> void:
  bar.value = float(health.health) / health.max_health


func on_death():
  bar.visible = false


func on_revive():
  bar.visible = true