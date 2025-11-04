class_name ObjectPool
extends Node

@export var object_scene : PackedScene
@export var pool_size := 100
@export var object_load_speed := 10

var pool : Array[Node2D] = []
var _object_pointer : int = 0
var _load_pointer : int = 0

func _ready() -> void:
  pool.resize(pool_size)


func _process(_delta: float) -> void:
  if pool[pool.size()-1] != null:
    process_mode = Node.PROCESS_MODE_DISABLED
    return
  var root_scene = get_tree().current_scene
  for i in range(object_load_speed):
    if _load_pointer > pool.size() - 1:
      return
    pool[_load_pointer] = object_scene.instantiate()
    pool[_load_pointer].hide()
    pool[_load_pointer].set_process(false)
    root_scene.add_child(pool[_load_pointer])
    _load_pointer += 1


func _pull_from_pool() -> Node2D:
  var object := pool[_object_pointer]
  object.set_process(true)
  object.show()
  if _object_pointer < pool_size-1:
    _object_pointer += 1 
  else:
    _object_pointer = 0
  return object
