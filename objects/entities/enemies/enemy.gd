extends Entity
class_name Enemy

var skill_cooldown : float = 1.0
@export var base_cooldown : float = 0.5


func _process(delta) -> void:
  skill_cooldown -= delta

  if skill_cooldown <= 0:
    var random_ability = randi_range(0,ability_component.abilities.size()-1)
    var ability = ability_component.abilities[random_ability]
    ability.execute(self)
    skill_cooldown += ability.cooldown + base_cooldown
