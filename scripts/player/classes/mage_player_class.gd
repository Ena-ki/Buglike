extends PlayerClass
 

func _ready():
  movement_ability = load_ability(self, movement_ability_scene)
  ability_1 = load_ability(self, ability_1_scene)
  ability_2 = load_ability(self, ability_2_scene)
  ability_2 = load_ability(self, ability_3_scene)