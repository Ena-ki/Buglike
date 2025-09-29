extends Projectile


func handle_bodies_inside(bodies : Array[Node2D]):
  for body in bodies:
    if body is not Player and body is Entity and body.attributes.invulnderable == false:
      body.damage(damage)
      queue_free()
    elif body is TileMapLayer:
      queue_free()
