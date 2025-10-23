extends Control

@export var levels : Collection
@export var level_label : Label

var _active_level := 0


func _ready() -> void:
  _cycle_levels(0)


func _cycle_levels(cycle_amount : int = 1) -> void:
  _active_level = (_active_level + cycle_amount) % levels.paths.size()
  GameData.level_scene_path = levels.paths[_active_level]
  _change_job_name()


func _change_job_name(level_number : int = _active_level) -> void:
  level_label.text = levels.names[level_number]


func _on_right_button_pressed() -> void:
  _cycle_levels(1)

func _on_left_button_pressed() -> void:
  _cycle_levels(-1)
