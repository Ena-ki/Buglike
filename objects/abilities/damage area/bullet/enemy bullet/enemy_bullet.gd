extends Bullet


func _die():
  set_process(false)
  hide()