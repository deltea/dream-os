class_name Room extends CanvasLayer

func _enter_tree() -> void:
	RoomManager.current_room = self

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("b"):
		RoomManager.change_room("main")
