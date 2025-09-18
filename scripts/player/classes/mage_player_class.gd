extends PlayerClass

func _ready():
  if movement_ability_scene:
    movement_ability = load_ability(self, movement_ability_scene)
  if dodge_ability_scene:
    dodge_ability = load_ability(self, dodge_ability_scene)
  if ability_1_scene:
    ability_1 = load_ability(self, ability_1_scene)
  if ability_2_scene:
    ability_2 = load_ability(self, ability_2_scene)
  if ability_3_scene:
    ability_3 = load_ability(self, ability_3_scene)

##dead
##alive
##  rooted
##  casting a spell
##  roaming
##  damaged