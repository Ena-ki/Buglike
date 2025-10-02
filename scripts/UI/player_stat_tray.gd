extends PanelContainer

@export var container : HBoxContainer

@export var health_label : Label

@export var skill_1 : TextureRect
@export var skill_2 : TextureRect
@export var skill_3 : TextureRect 
@export var skill_4 : TextureRect

@export var tray_side : Enums.Side = Enums.Side.LEFT

var player : Player

func _ready():
  print(name + " " + str(tray_side))
  if tray_side == Enums.Side.RIGHT:
    container.layout_direction = Control.LAYOUT_DIRECTION_RTL


func on_player_damaged(_damage):
  update()


func _process(_delta: float) -> void:
  if player:
    skill_1.cooldown = player.player_class.ability_1.cooldown
    skill_2.cooldown = player.player_class.ability_2.cooldown
    skill_3.cooldown = player.player_class.ability_3.cooldown
    skill_4.cooldown = player.player_class.ability_4.cooldown


func set_up():
  if !player:
    visible = false
    process_mode = Node.PROCESS_MODE_DISABLED
    return
  player.damaged.connect(on_player_damaged)
  update()


func update():
  if tray_side == Enums.Side.LEFT:
    health_label.text = "   : " + str(max(int(player.health),0)) + " "
  else:
    health_label.text = " " + str(max(int(player.health),0)) + " :  "
  
