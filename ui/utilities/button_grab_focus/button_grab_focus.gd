extends Button


func _ready():
  visibility_changed.connect(on_button_visibility_changed)
  if is_visible_in_tree():
    grab_focus()


func on_button_visibility_changed():
  grab_focus()  

