extends Entity

@export var filler_ability : Ability
@export var abilities : Array[Ability] = []
@export var state_machine : StateMachine

var cooldown := 0.0

# we want boss to have a filler ability (move towards player, etc) and
# and an acutal ability that will do shit and manage filter ability
func _ready():
  filler_ability.execute(self)


func _process(_delta):
  if cooldown > 0.0:
    return

  var current_ability = abilities[randi_range(0,abilities.size()-1)]
  cooldown += current_ability.cooldown
  await current_ability.execute(self)


func _physics_process(delta: float) -> void:
  move_and_collide(velocity * delta)
