shader_type canvas_item;

void fragment() {
	COLOR = vec4((sin(TIME - UV.x * 16.0) + 1.0) / 2.0, cos((TIME + UV.y * 16.0) + 1.0) / 2.0, 1.0, 1.0);
}
