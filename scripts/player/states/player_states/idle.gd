class_name Idle extends PlayerState




func update(delta : float):
  # 이동 스킬 사용 중에는 상태가 강제로 바뀌지 않도록 보호합니다. (보스 등 호환성 유지)
  if "active_movement_ability" in owner and owner.active_movement_ability: return

  if owner.health <= 0:
    emit_signal("transition", self, "Died")
    
    
  if owner.velocity.length() >= 1.0:
    emit_signal("transition", self, "walking")
