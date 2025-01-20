extends CanvasLayer

@export var transition_time = 0.5

# var room: PackedScene = preload("res://rooms/room.tscn")
@onready var player: AnimationPlayer = $AnimationPlayer
@onready var rect: TextureRect = $TextureRect

## The current loaded room object.
var current_room: Room

func _ready() -> void:
	player.speed_scale = 1 / transition_time

## Change the current room to another room from the name of the room.
func change_room(room_name: String):
	var scene = get(room_name + "_room")
	if not scene:
		printerr(room_name + " is not a valid room")
		return

	player.play_backwards("transition")

	get_tree().change_scene_to_packed(scene)

	player.play("transition")
