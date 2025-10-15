extends PanelContainer

@export var not_joined_label : Label
@export var joined_menu : VBoxContainer
@export var selected_class_label : Label
@export var ready_label : Label
@export var player_number_label : Label
@export var player_number : int = 1

var is_joined := false
var is_ready := false
var classes := ["mage", "warrior"]
var current_class := 0


func _ready():
  player_number_label.text = "Player " + str(player_number)


func _process(_delta):
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_1"):
    join()
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_2") and is_joined:
    ready_up()
  
  if Input.is_action_just_pressed("player_" + str(player_number) + "_left") and is_joined:
    current_class = cycle_array(current_class, -1, classes.size())
    selected_class_label.text = classes[current_class]
  if Input.is_action_just_pressed("player_" + str(player_number) + "_right") and is_joined:
    current_class = cycle_array(current_class, 1, classes.size())
    selected_class_label.text = classes[current_class]


func join(join_state = null):
  if join_state is not bool and join_state != null:
    push_warning("select_card.gd: wrong type variable provided, use bool")
    return
  if join_state == null:
    is_joined = !is_joined
  else:
    is_joined = join_state


  # disable / enable all of the joined behaviour
  if is_joined == true:
    not_joined_label.visible = false
    joined_menu.visible = true
    joined_menu.process_mode = Node.PROCESS_MODE_INHERIT
  else:
    not_joined_label.visible = true
    joined_menu.visible = false
    reset_ui()
    joined_menu.process_mode = Node.PROCESS_MODE_DISABLED


func ready_up(ready_state = null):
  if ready_state is not bool and ready_state != null:
    push_warning("select_card.gd: wrong type variable provided, use bool")
    return
  
  if ready_state == null:
    is_ready = !is_ready
  else:
    is_ready = ready_state
  
  if is_ready == true:
    ready_label.text = "Ready!"
  else:
    ready_label.text = "Not Ready!"


func reset_ui():
  ready_up(false)
  current_class = 0
  selected_class_label.text = classes[current_class]


func cycle_array(cur_num : int, increase : int, arr_size : int) -> int:
  var out = cur_num + increase
  if arr_size <= out:
    while arr_size <= out:
      out -= arr_size
  elif out < 0:
    while out < 0:
      out += arr_size
  return out
