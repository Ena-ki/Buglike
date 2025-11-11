extends Enemy

@export var bar : ProgressBar

func _physics_process(delta: float) -> void:
  move_and_collide(velocity * delta)


func on_ready():
  var yes := 0
  for i in range(GameData.players_ready.size()):
    if GameData.players_ready[i] == true:
      yes += 1
  if yes == 1:
    health.set_max_health(health.max_health / 2)


func update(_delta) -> void:
  bar.value = float(health.health) / health.max_health


func on_death():
  bar.visible = false


func on_revive():
  bar.visible = true
