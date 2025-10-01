extends Control
@export_custom(PROPERTY_HINT_FILE, "*.tscn") var game_scene : String

@export var main_screen : Control
@export var quit_button : Button
@export var play_button : Button

@export var character_select_screen : Control
@export var player_1_card : PanelContainer
@export var player_2_card : PanelContainer


var is_on_main_screen := true


func _process(_delta):
  if Input.is_action_just_pressed("ui_cancel") and is_on_main_screen == false:
    change_screens()
  if player_1_card.is_ready == true and player_2_card.is_ready == true:
    Globals.game_manager.change_scene(game_scene)


func _ready():
  quit_button.pressed.connect(on_quit_button_pressed)
  play_button.pressed.connect(on_play_button_pressed)

func on_play_button_pressed():
  change_screens()


func change_screens():
  is_on_main_screen = !is_on_main_screen
  if is_on_main_screen:
    main_screen.visible = true
    character_select_screen.visible = false
    player_1_card.reset_ui()
    player_1_card.join(false)
    player_2_card.reset_ui()
    player_2_card.join(false)
    main_screen.process_mode = Node.PROCESS_MODE_INHERIT
    character_select_screen.process_mode = Node.PROCESS_MODE_DISABLED
  else:
    main_screen.visible = false
    character_select_screen.visible = true
    main_screen.process_mode = Node.PROCESS_MODE_DISABLED
    character_select_screen.process_mode = Node.PROCESS_MODE_INHERIT


func on_quit_button_pressed():
  get_tree().quit()
  
