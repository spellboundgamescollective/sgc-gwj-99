extends "res://addons/maaacks_game_template/base/nodes/menus/options_menu/paginated_tab_container.gd"

## Shows the tab for controls remapping even if no input actions are found.
@export var force_show_controls:bool = false
## Shows a tab for input sensitivity sliders on the mouse and joypad.
## These require manual setup. For example, call `PlayerConfig.get_config(AppSettings.INPUT_SECTION, "MouseSensitivity", 1.0)`
## to get a float of the desired mouse sensitivity and apply it to the camera motion.
## Refer to the documentation on Options Menu Setup for more.
@export var show_input_sensitivity:bool = false


func _ready()->void:
	var inputs_actions:Array = AppSettings.get_action_names()
	for iter:int in range(get_tab_count()):
		if get("tab_%d/title" % iter) == "Controls":
			set("tab_%d/hidden" % iter, inputs_actions.is_empty() and not force_show_controls)
			continue
		if get("tab_%d/title" % iter) == "Inputs":
			set("tab_%d/hidden" % iter, not show_input_sensitivity)
			continue
