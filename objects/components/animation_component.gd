class_name AnimationComponent
extends AnimationTree

enum Animations{IDLE, WALK}

@export var blend_speed : float = 15
@export var sprite : Sprite2D

var _walk_val : float = 0
var _current_anim : Animations = Animations.IDLE


func _process(delta) -> void:
  if owner.velocity.x < 0:
    sprite.flip_h = true
  else:
    sprite.flip_h = false

  _handle_anims()
  _update_anim_tree()
  if _current_anim == Animations.IDLE:
    _walk_val = lerpf(_walk_val,0, delta * blend_speed)
  else:
    _walk_val = lerpf(_walk_val,1, delta * blend_speed)


func _update_anim_tree():
  self["parameters/walk/blend_amount"] = _walk_val


func _on_health_component_damaged(_damage_amount: int) -> void:
  self["parameters/hit/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE


func _handle_anims():
  if owner.velocity.length() > 0:
    _current_anim = Animations.WALK
  else:
    _current_anim = Animations.IDLE
