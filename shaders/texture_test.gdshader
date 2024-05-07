shader_type canvas_item;

uniform int mode;

void fragment() {
	if (mode == 0) {
		vec3 texture_color = 0.5 * texture(TEXTURE, vec2(1.0) - UV).xyz;
		COLOR.rgb = texture_color + 0.5 * texture(TEXTURE, UV).xyz;
	} else if (mode == 1) {
		float y_pos = float(int(128.0 * (UV.y - sin(TIME + UV.x * 4.0))) % 128) / 128.0;
		COLOR = texture(TEXTURE, vec2(UV.x, y_pos));
	} else if (mode == 2) {
		float scale = 5.0;
		COLOR = texture(TEXTURE, UV + sin(UV * scale) / scale);
		COLOR.rgb = vec3(0.299 * COLOR.r + 0.587 * COLOR.g + 0.114 * COLOR.b);
	} else if (mode == 3) {
		vec3 circle = vec3(0.5, 0.5, 0.3);
		float d = length(UV - circle.xy) - circle.z;
		d = smoothstep(0.0, 0.01, d);
		COLOR.rgb = vec3(d);
	}
}
