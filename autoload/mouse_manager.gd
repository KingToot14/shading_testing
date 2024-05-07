@tool
extends Node

# --- Variables --- #


# --- Functions --- #
func _process(delta):
	RenderingServer.global_shader_parameter_set('mouse_position', get_viewport().get_mouse_position())
