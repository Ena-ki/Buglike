extends Entity
class_name Enemy

@export var object_pool : ObjectPool
@export var base_cooldown : float = 0.5

var _skill_cooldown : float = 1.0
var _movement_cooldown : float = 1.0
var _current_ability : Ability = null


func _process(delta) -> void:
  if _current_ability and _current_ability.is_active :
    return
  _skill_cooldown -= delta
  if velocity.length() <= 0.5:
    _movement_cooldown -= delta

  if _skill_cooldown <= 0:
    var random_ability = randi_range(1,ability_component.abilities.size()-1)
    _current_ability = ability_component.abilities[random_ability]
    _current_ability.execute(self)
    _skill_cooldown = _current_ability.cooldown + base_cooldown

  if _movement_cooldown <= 0:
    var ability = ability_component.abilities[0]
    ability.execute(self)
    _movement_cooldown = ability.cooldown + base_cooldown
