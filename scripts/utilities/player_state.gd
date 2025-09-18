@abstract
class_name PlayerState extends State


func on_player_damaged(damage):
    emit_signal("transition", self, "damaged")
    

func on_player_died():
    emit_signal("transition", self, "died")
<<<<<<< HEAD

>>>>>>> origin/tena
