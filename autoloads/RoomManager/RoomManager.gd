extends CanvasLayer

const transition_time = 0.5
const wait_time = 0.3

var rooms = {
	"test": preload("res://rooms/test.tscn"),
	"main": preload("res://rooms/main/main.tscn"),
	"music": preload("res://rooms/apps/music/music.tscn"),
	"movies": preload("res://rooms/apps/movies/movies.tscn"),
	"games": preload("res://rooms/apps/games/games.tscn"),
	"settings": preload("res://rooms/apps/settings/settings.tscn"),
}

@onready var player: AnimationPlayer = $AnimationPlayer
@onready var rect: TextureRect = $TextureRect

var current_room: Room
var transitioning = false

func _ready() -> void:
	player.speed_scale = 1 / transition_time

## Change the current room to another room from the name of the room.
func change_room(room_name: String):
	if transitioning:
		printerr("already transitioning")
		return

	if !rooms.has(room_name):
		printerr(room_name + " is not a valid room")
		return

	var scene = rooms[room_name]

	# Could be better, but it works for now
	if room_name == current_room.name.to_lower():
		printerr(room_name + " is the same room")
		return

	player.play_backwards("transition")
	transitioning = true
	await Clock.wait(transition_time)

	get_tree().change_scene_to_packed(scene)
	print("changed room to " + room_name)

	await Clock.wait(wait_time)
	transitioning = false
	player.play("transition")
