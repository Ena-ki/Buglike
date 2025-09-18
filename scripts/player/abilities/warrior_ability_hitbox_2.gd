extends Area2D

# This variable is set by the ability script that creates the hitbox
var creator = null

const HITBOX_DURATION = 0.3 # How long the hitbox stays active

func _ready():
  # Connect the area_entered signal to our function
  self.area_entered.connect(_on_area_entered)
  
  # Create a timer to automatically destroy the hitbox
  var timer = get_tree().create_timer(HITBOX_DURATION)
  timer.timeout.connect(queue_free)


func _on_area_entered(area):
  # Check if the entered area is a projectile
  if area.is_in_group("projectiles"):
    area.queue_free() # Destroy the projectile
  
  # Optional: Add logic here to damage enemies
  # if area.is_in_group("enemies"):
  #   pass # Deal damage
