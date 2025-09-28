extends Entity

@export var abilities : Array[Node2D] = []

var attack_cooldown : float = 0


func _process(delta):
  if attack_cooldown <= 0:
    attack_cooldown += abilities[randi_range(0,abilities.size()-1)].execute(self)
  else:
    attack_cooldown -= delta
