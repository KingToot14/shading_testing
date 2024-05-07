shader_type canvas_item;

group_uniforms Circle;
uniform float circle_radius: hint_range(0.0, 1.0, 0.01) = 0.5;
uniform float shading_inset: hint_range(0.0, 1.0, 0.01) = 0.2;
uniform float outline_inset: hint_range(0.0, 1.0, 0.001) = 0.016;
uniform float outline_threshold: hint_range(0.0001, 1, 0.0001) = 0.0001;

group_uniforms Color;
uniform float saturation: hint_range(0, 1) = 1.0;
uniform float value: hint_range(0, 1) = 1.0;


vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
	float d = length(UV - vec2(0.5)) - circle_radius;
	float o = d + outline_inset;
	float s = d + shading_inset;
	d = 1.0 - step(0.0, d);
	o = step(0.0, o);
	
	vec4 top =    texture(TEXTURE, UV - vec2(0.0, TEXTURE_PIXEL_SIZE.y));
	vec4 bottom = texture(TEXTURE, UV + vec2(0.0, TEXTURE_PIXEL_SIZE.y));
	vec4 left =   texture(TEXTURE, UV - vec2(TEXTURE_PIXEL_SIZE.x, 0.0));
	vec4 right =  texture(TEXTURE, UV + vec2(TEXTURE_PIXEL_SIZE.x, 0.0));
	
	float v = step(outline_threshold,  (top.r - COLOR.r));
	v += step(outline_threshold, (bottom.r - COLOR.r));
	v += step(outline_threshold, (left.r - COLOR.r));
	v += step(outline_threshold, (right.r - COLOR.r));
	
	v += o;
	
	COLOR = vec4(hsv2rgb(vec3(COLOR.r, saturation, (value - s) * (1.0 - v))), d);
}
