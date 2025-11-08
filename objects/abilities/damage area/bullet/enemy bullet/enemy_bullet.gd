extends Bullet


func _die():
  call_deferred("set", "process_mode", Node.PROCESS_MODE_DISABLED)
  hide()