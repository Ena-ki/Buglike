extends TextureRect


func _ready():
  material = material.duplicate()


func update(ability : Ability):
  if ability.icon != null and texture != ability.icon:
    texture = ability.icon
  var cooldown = ability.cooldown_left / ability.cooldown
  material.set_shader_parameter("cooldown", clamp(cooldown,0.0,1.0))
