extends Control

@export var skill_icons : Array[TextureRect] = [null,null,null,null]
@export var health_bar : ProgressBar


func update(player : Player):
  for i in range(skill_icons.size()):
    if player.ability_component.abilities[i + 1] == null:
      continue
    skill_icons[i].update(player.ability_component.abilities[i + 1])
  health_bar.value = float(player.health.health) / player.health.max_health
