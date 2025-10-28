extends Control

@export var trays : Array[Control] = [null, null]


func update(players : Array[Player]):
  for i in range(players.size()):
    if players[i] != null:
      trays[i].update(players[i])
    elif trays[i].visible == true:
      trays[i].visible = false
    
