extends TextureRect

var cooldown : float = 0.0 : set = set_cooldown


func _ready():
  material = material.duplicate()


func _process(_delta):
  material.set_shader_parameter("cooldown", clamp(cooldown,0.0,1.0))


func set_cooldown(new_cooldown : float):
  cooldown = new_cooldown
