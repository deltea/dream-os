extends Room

@onready var apps = $Apps
@onready var app_name: RichTextLabel = $AppNameContainer/CenterContainer/AppName
@onready var app_name_container: NinePatchRect = $AppNameContainer

var curr_index: int = 0

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
		update_selected_app()

	if Input.is_action_just_pressed("a"):
		RoomManager.change_room(apps.get_child(curr_index).app_name)

func update_selected_app() -> void:
	app_name.text = "[center][wave freq=3 amp=10]" + apps.get_child(curr_index).app_name
	print(apps.get_child(curr_index).app_name + " selected")
