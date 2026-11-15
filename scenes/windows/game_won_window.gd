@tool
extends PopupWindowPanel

signal continue_pressed
signal main_menu_pressed

func _ready() -> void:
	super._ready()
	if OS.has_feature("web"):
		%ExitButton.hide()

func _on_exit_button_pressed() -> void:
	%ExitConfirmation.show()

func _on_main_menu_button_pressed() -> void:
	%MainMenuConfirmation.show()

func _on_close_button_pressed() -> void:
	continue_pressed.emit()
	close()

func _on_main_menu_confirmation_confirmed() -> void:
	main_menu_pressed.emit()
	close()

func _on_exit_confirmation_confirmed() -> void:
	get_tree().quit()
