extends Node2D
var accept 


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.touch == false:
		get_node("touchMode/CheckButton").set_pressed(false)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	print(Global.touch)
#	print(ProjectSettings.get_setting("application/config/name"))
#	print(ProjectSettings.get_setting("input/ui_up"))
#	print(ProjectSettings.get_setting("input/ui_up"))
#	ProjectSettings.clear("input/ui_up")
#	print(ProjectSettings.set_setting("input/ui_accept", accept))
#	ProjectSettings.set_setting("input/ui_up", accept)
#	print (accept)
	pass


func _on_LineEdit_text_entered(new_text):
	accept = new_text
#	cambiarTecla()
	pass # Replace with function body.

func cambiarTecla():
	ProjectSettings.set_setting("input/ui_up", accept).clear(InputEvent)
	print(ProjectSettings.set_setting("input/ui_up", accept))
	print(ProjectSettings.get_setting("input/ui_up"))
	print (accept)


func _on_Volver_button_down():
	Global_cambiar_nivel.goto_scene("res://Menus/MenuPrincipal/MenuPrincipal.tscn")
	pass # Replace with function body.


func _on_CheckButton_toggled(button_pressed):
	if button_pressed == true:
		Global.touch = true
	if button_pressed == false:
		Global.touch = false
		
	pass # Replace with function body.
