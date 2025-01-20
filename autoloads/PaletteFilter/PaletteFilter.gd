extends CanvasLayer

@export var default_palette: Texture2D

var palette: Texture2D

func _ready() -> void:
	set_color_palette()

func set_color_palette(new_palette: Texture2D = null):
	if new_palette:
		palette = new_palette
	else:
		palette = default_palette

	print("color palette changed to " + palette.resource_path)

	$ColorRect.material.set_shader_parameter("palette_out", palette)
