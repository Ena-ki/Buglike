extends Node

enum PlayerCount{
  ONE_PLAYER = 1,
  TWO_PLAYERS = 2,
}

var player_count : PlayerCount = PlayerCount.ONE_PLAYER
var level_scene : PackedScene
var ability_component_scenes : Array[PackedScene]
