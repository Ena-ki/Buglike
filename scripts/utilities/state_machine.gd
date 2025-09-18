class_name StateMachine extends Node


@export var initial_state : State

var current_state : State
var states : Dictionary = {}


func _ready():
  for child in get_children():
    if child is State:
      states[child.name.to_lower()] = child
      child.transition.connect(on_state_transition)
  

  await owner.ready
  if initial_state :
    current_state = initial_state
    current_state.enter()
  else: 
    current_state = states[states.keys()[0]]
    current_state.enter()


func _process(delta):
  if current_state:
    current_state.update(delta)


func _physics_process(delta: float) -> void:
  if current_state:
    current_state.physics_update(delta) 


func on_state_transition(state : State, new_state_name : String) -> void:
  if state != current_state:
    return
  
  var new_state = states.get(new_state_name.to_lower())
  
  if current_state:
    current_state.exit()
  
  new_state.enter()

  current_state = new_state
  
  
