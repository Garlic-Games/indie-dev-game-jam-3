extends Node

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);

func _input(event):
	if event is InputEventKey and event.is_action_pressed("pause"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);

