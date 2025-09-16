extends Projectile



func _ready():
    body_entered.connect(on_body_entered)


func on_body_entered(body : Node2D):
    if body is Player :
        body.damage(damage)
        queue_free()
    elif body is TileMapLayer:
        queue_free()
