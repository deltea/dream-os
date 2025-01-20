class_name Room extends CanvasLayer

func _enter_tree() -> void:
	RoomManager.current_room = self
