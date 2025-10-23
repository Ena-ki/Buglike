extends PanelContainer

@export var player_label : Label

@export var not_joined_panel : Control

@export var joined_panel : Control
@export var chosen_job_label : Label

@export var player_number := Player.PlayerNumber.PLAYER_1
@export var jobs : Collection

var _active_panel : Control
var _active_job := 0


func _ready() -> void:
  _active_panel = not_joined_panel
  _cycle_jobs(0)
  _change_player_number_text()


func _change_player_number_text():
  player_label.text = "Player " + str(player_number)


func _process(_delta) -> void:
  if Input.is_action_just_pressed("player_" + str(player_number) + "_ability_1"):
    _switch_panel()
  
  if GameData.players[player_number - 1] == false:
    return

  if Input.is_action_just_pressed("player_" + str(player_number) + "_left"):
    _cycle_jobs(1)
  if Input.is_action_just_pressed(str("player_" + str(player_number) + "_right")):
    _cycle_jobs(-1)

  
func _cycle_jobs(cycle_amount : int = 1) -> void:
  _active_job = (_active_job + cycle_amount) % jobs.paths.size()
  GameData.ability_component_paths[player_number - 1] = jobs.paths[_active_job]
  _change_job_name()


func _change_job_name(job_number : int = _active_job) -> void:
  chosen_job_label.text = "< " + jobs.names[job_number] + " >"


func _switch_panel():
  if GameData.players[player_number - 1] == true:
    joined_panel.visible = false
    not_joined_panel.visible = true
    _active_panel = not_joined_panel
    GameData.players[player_number - 1] = false
  else:
    joined_panel.visible = true
    not_joined_panel.visible = false
    _active_panel = joined_panel
    GameData.players[player_number - 1] = true
