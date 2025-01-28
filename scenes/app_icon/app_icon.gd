class_name AppIcon extends TextureRect

@export var app_name = "main"

func _ready() -> void:
	$Shadow.texture = texture

func _process(_delta: float) -> void:
	# material.set_shader_parameter("intensity", abs(((global_position.x + size.x / 2) - get_viewport_rect().size.x / 2) / (get_viewport_rect().size.x / 2)))
	# $Shadow.material.set_shader_parameter("intensity", abs(((global_position.x + size.x / 2) - get_viewport_rect().size.x / 2) / (get_viewport_rect().size.x / 2)))

	# print(get_screen_position().x)
	# var intensity = 0.5 if (get_screen_position().x <= 40.0 or get_screen_position().x >= get_viewport_rect().size.x - 40.0) else 0.0
	# material.set_shader_parameter("intensity", intensity)
	# $Shadow.material.set_shader_parameter("intensity", intensity)

	pass
