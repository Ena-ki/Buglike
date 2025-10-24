extends Control

signal unpaused()
signal paused()

@export var overlay_screen : Control
@export var pause_screen : SubMenu

var _active_screen : Control


func _process(_delta) -> void:
  if Input.is_action_just_pressed("ui_menu"):
    if _active_screen == pause_screen:
      switch_screen(overlay_screen)
      emit_signal("unpaused")
    else:
      switch_screen(pause_screen)
      emit_signal("paused")


func switch_screen(new_screen : Control) -> void:
  if new_screen == _active_screen:
    return
  _active_screen.visible = false
  _active_screen = new_screen
  _active_screen.visible = true


func _on_pause_menu_go_back() -> void:
  switch_screen(overlay_screen)
  emit_signal("unpaused")
