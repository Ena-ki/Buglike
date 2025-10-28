extends Control

@export var pause_menu : Control
@export var hud : Control

var _players : Array[Player] = []
@onready var _active_screen : Control = hud


func _process(_delta: float) -> void:
  if _players.is_empty():
    return

  if Input.is_action_just_pressed("ui_cancel"):
    if _active_screen == hud:
      switch_screen(pause_menu)
      owner.process_mode = Node.PROCESS_MODE_DISABLED
    else:
      switch_screen(hud)
      owner.process_mode = Node.PROCESS_MODE_INHERIT
  
  hud.update(_players)


func set_up(new_players : Array[Player]):
  _players = new_players


func _on_pause_menu_go_back() -> void:
  switch_screen(hud)
  owner.process_mode = Node.PROCESS_MODE_INHERIT



func switch_screen(new_screen : Control) -> void:
  if new_screen != _active_screen:
    _active_screen.visible = false
    _active_screen = new_screen
    _active_screen.visible = true
