class_name AppIcon extends TextureRect

@export var app_name = "main"

func _process(_delta: float) -> void:
	# material.set_shader_parameter("intensity", abs(((global_position.x + size.x / 2) - get_viewport_rect().size.x / 2) / (get_viewport_rect().size.x / 2)))
	# $Shadow.material.set_shader_parameter("intensity", abs(((global_position.x + size.x / 2) - get_viewport_rect().size.x / 2) / (get_viewport_rect().size.x / 2)))
	pass
