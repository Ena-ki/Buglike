class_name GameManager extends Node

@export_custom(PROPERTY_HINT_FILE, "*.tscn") var initial_scene: String

var current_scene 
var current_scene_path

func _ready():
  if initial_scene:
    current_scene_path = initial_scene
    reload_current_scene()
  Globals.game_manager = self
  change_scene(initial_scene)
  

func change_scene(new_scene : String, delete : bool = true, keep_running : bool = false) -> void:
  if current_scene != null:
    if delete:
      current_scene.queue_free()
    elif keep_running:
      current_scene.visible = false
    else:
      remove_child(current_scene)
  var new = load(new_scene).instantiate()
  add_child(new)
  current_scene = new
  current_scene_path = new_scene


func reload_current_scene():
  change_scene(current_scene_path)
  

func add_child_current_scene(child):
  current_scene.add_child(child)
