class_name PauseMenu;
extends CanvasLayer;

signal opened;
signal closed;
@onready var settings_menu: SettingsContainer = %SettingsMenu;
@onready var exit_game_confirm_menu: ConfirmMenu = %ExitGameConfirmMenu;
@onready var main_menu_confirm_menu: ConfirmMenu = %MainMenuConfirmMenu;
@onready var main_pause_menu: Control = %MainPauseMenu;
@export_file("*.tscn") var main_menu_scene: String;


func _ready():
	assert(main_menu_scene, "Set a main menu scene for the pause menu");
	settings_menu.connect("closed", main_pause_menu.show);
	hide();


func _process(delta):
	if not is_visible():
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);


func toogle() -> bool:
	if visible:
		get_tree().paused = false;
		close();
	else:
		get_tree().paused = true;
		open();
	return visible;


func open() -> void:
	opened.emit();
	show();

func close() -> void:
	closed.emit();
	get_tree().paused = false;
	hide();

func open_settings() -> void:
	main_pause_menu.hide();
	settings_menu.open();
	
func open_exit_confirmation() -> void:
	exit_game_confirm_menu.open();
	
func open_main_confirmation() -> void:
	main_menu_confirm_menu.open();
	
func choose_exit_game(choice: bool) -> void:
	if choice:
		get_tree().quit();
	else:
		exit_game_confirm_menu.close();
	
func choose_main_menu(choice: bool) -> void:
	if choice:
		get_tree().paused = false;
		SceneLoader.load_scene(main_menu_scene);
	else:
		main_menu_confirm_menu.close();
	
