extends Resource
class_name PlayerClassRes



@export_group("Class Metadata")
@export var player_class_name : String = "Undefined Class"
@export var player_class_sprite_frames : SpriteFrames
@export var speed : float = 1.0

@export_group("Ability Metadata")
@export_subgroup("abilities")
@export var ability_1_scene : PackedScene
@export var ability_2_scene : PackedScene
@export var ability_3_scene : PackedScene
@export var ability_4_scene : PackedScene
@export_subgroup("Ability Names")
@export var ability_1_name : String = "Ability 1"
@export var ability_2_name : String = "Ability 2"
@export var ability_3_name : String = "Ability 3"
@export var ability_4_name : String = "Ability 4"
@export_subgroup("Ability textures")
@export var ability_1_texture : Texture2D
@export var ability_2_texture : Texture2D
@export var ability_3_texture : Texture2D
@export var ability_4_texture : Texture2D
@export_group("Ability Stats")

@export_subgroup("Ability Cooldowns")
@export var ability_1_cooldown_time : float = 1.0
@export var ability_2_cooldown_time : float = 1.0
@export var ability_3_cooldown_time : float = 1.0
@export var ability_4_cooldown_time : float = 1.0
@export_subgroup("Ability Damage")
@export var ability_1_damage : float = 1.0
@export var ability_2_damage : float = 1.0
@export var ability_3_damage : float = 1.0
@export var ability_4_damage : float = 1.0

