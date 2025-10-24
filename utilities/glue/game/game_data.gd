extends Node

var main_menu_path : String = "res://ui/main menu/main_menu.tscn"
var game_path : String = "res://utilities/glue/game/game.tscn"

var players : Array[bool] = [false, false]
var ability_component_paths : Array[String] = ["",""]
var level_scene_path : String = ""