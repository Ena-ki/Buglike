extends PlayerClass


func _ready():
  movement_ability = load_ability(self, movement_ability_scene)
  ability_1 = load_ability(self, ability_1_scene)
  ability_2 = load_ability(self, ability_2_scene)
  ability_2 = load_ability(self, ability_3_scene)

  damaged.connect(on_player_class_damaged)
  died.connect(on_player_class_damaged)


func on_player_class_died():
  is_alive = false
  print("me ded")


func on_player_class_damaged():
  print("I got hit")

##dead
##alive
##  rooted
##  casting a spell
##  roaming
##  damaged
