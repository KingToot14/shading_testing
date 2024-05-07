@tool
class_name ScrollingWater
extends Sprite2D

# --- Variables --- #
@export var animate: bool = false
@export var scroll_speed: float
@export var scroll_time: float = 0

@export var textures: Array[NoiseTexture2D] = [];

# --- References --- #

# --- Functions --- #
func _process(delta):
	if not animate:
		return
	
	scroll_time = scroll_time + delta
	for text in textures:
		text.noise.offset -= Vector3(
			0.4 * (sin(scroll_time) + 1.5) * scroll_speed * delta, 
			0.4 * (cos(scroll_time + 1.5) + 1.5) * scroll_speed * delta, 0.0)
		text.noise.domain_warp_frequency = 0.005 * (sin(scroll_time / 200)) + 0.055
