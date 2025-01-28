extends Room

const divider_speed = 20.0

@onready var divider: TextureRect = $Divider

func _process(delta: float) -> void:
	super._process(delta)

	divider.position.y = -32 + fmod(Clock.time * divider_speed, 32.0)
