@abstract class_name Ability extends Node2D

var cooldown : float = 0.0 : get = get_cooldown


@abstract func execute(caster)
@abstract func get_cooldown()
