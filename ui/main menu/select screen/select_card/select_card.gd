extends PanelContainer

@export var player_label : Label

@export var not_joined_panel : Label

@export var joined_panel : Control
@export var chosen_job_label : Label
@export var job_texture : TextureRect
@export var skill_textures : Array[TextureRect] = []
@export var skill_labels : Array[Label] = []

@export var player_number := Player.PlayerNumber.PLAYER_1
@export var jobs : Collection

var _cur_job_number : int = 0
var _is_joined : bool = false


func _ready() -> void:
  _change_player_number_text()
  _cycle_jobs(0)


func _process(_delta: float) -> void:
  if Input.is_action_just_pressed(str("player_", int(player_number), "_ability_1")):
    _join()
  if _is_joined == false:
    return
  
  if Input.is_action_just_pressed(str("player_", int(player_number), "_left")):
    _cycle_jobs(-1)

  if Input.is_action_just_pressed(str("player_", int(player_number), "_right")):
    _cycle_jobs(1)


func _cycle_jobs(cycle_by : int = 1):
  _cur_job_number = posmod((_cur_job_number + cycle_by ), jobs.paths.size()) # fucking shit ass bitch fuck
  GameData.ability_component_paths[player_number-1] = jobs.paths[_cur_job_number]
  chosen_job_label.text = str("< ", jobs.names[_cur_job_number], " >")
  var cur_job = load(jobs.paths[_cur_job_number]).instantiate() as AbilityComponent
  job_texture.texture = cur_job.sprite
  for i in range(skill_textures.size()):
    skill_textures[i].texture = cur_job.abilities[i+1].icon
    skill_labels[i].text = cur_job.abilities[i+1].ability_name
  


func _join():
  _is_joined = !_is_joined
  GameData.players_ready[player_number-1] = _is_joined
  not_joined_panel.visible = !not_joined_panel.visible
  joined_panel.visible = !joined_panel.visible


func _change_player_number_text():
  player_label.text = "Player " + str(player_number)
  if player_number == Player.PlayerNumber.PLAYER_1:
    not_joined_panel.text = "Press J!"
  else:
    not_joined_panel.text = "Press C!"
