shader_type canvas_item;

global uniform vec2 mouse_position;

uniform float radius: hint_range(0.0, 1.0, 0.1) = 0.25;
uniform float alpha: hint_range(0.0, 1.0, 0.1) = 1.0;

void fragment() {
	float d = length((mouse_position - FRAGCOORD.xy) * SCREEN_PIXEL_SIZE.x) - SCREEN_PIXEL_SIZE.x / TEXTURE_PIXEL_SIZE.x * radius;
	d = smoothstep(0.0, 0.01, d);
	
	COLOR.a *= d;
}
