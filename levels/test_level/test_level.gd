extends Level



func _on_boss_spawner_boss_beaten() -> void:
	emit_signal("beaten")

