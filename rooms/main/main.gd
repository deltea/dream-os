extends Room

@onready var apps = $Apps
@onready var app_name: RichTextLabel = $AppNameContainer/CenterContainer/AppName
@onready var app_name_container: NinePatchRect = $AppNameContainer

const app_icon_float_speed = 3.0
const app_icon_float_magnitude = 5.0

var curr_index: int = 0
var float_timer = 0.0
var direction = 1

func _ready() -> void:
	update_selected_app()

func _process(delta: float) -> void:
	super._process(delta)
	# var target_x = (curr_index - 1) * (apps.get_theme_constant("separation") + apps.get_child(0).size.x)
	# apps.global_position.x = lerp(apps.global_position.x, target_x, 20 * delta)
	apps.global_position.x = lerp(apps.global_position.x, 176 - curr_index * (apps.get_child(0).size.x + apps.get_theme_constant("separation")), 20.0 * delta)

	var x_input = Input.get_axis("left", "right")
	if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("left"):
		curr_index = (curr_index + int(x_input)) % apps.get_child_count()
		if curr_index < 0: curr_index = apps.get_child_count() - 1

		direction = x_input
		update_selected_app()

	if Input.is_action_just_pressed("a"):
		RoomManager.change_room(apps.get_child(curr_index).app_name)

	for i in range(apps.get_child_count()):
		var app = apps.get_child(i) as AppIcon
		if i == curr_index:
			# app.position.y = sin(float_timer * app_icon_float_speed) * app_icon_float_magnitude - app_icon_float_magnitude
			app.position.y = lerp(app.position.y, -16.0, 5.0 * delta)
			app.rotation_degrees = lerp(app.rotation_degrees, 15.0 * direction, 5.0 * delta)
		else:
			app.position.y = lerp(app.position.y, 0.0, 5.0 * delta)
			app.rotation_degrees = lerp(app.rotation_degrees, 0.0, 5.0 * delta)

	float_timer += delta

func update_selected_app() -> void:
	print(apps.get_child(curr_index).app_name + " selected")
	app_name.text = "[center][wave freq=3 amp=10]" + apps.get_child(curr_index).app_name
	float_timer = app_icon_float_speed
