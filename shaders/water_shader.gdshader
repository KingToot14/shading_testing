shader_type canvas_item;

void fragment() {
	COLOR = texture(TEXTURE, vec2(UV.x + 0.2 * (sin(TIME)), UV.y - 0.2 * (cos(TIME + 1.5))));
	COLOR = vec4(COLOR.r - 0.40, COLOR.g + 0.05, 1.0, 1.0);
}

