shader_type canvas_item;

uniform sampler2D shadow_texture;

void fragment() {
	COLOR.rgb = vec3(0.078, 0.416, 1.0);
	
	vec3 highlights = smoothstep(0.65, 0.85, texture(TEXTURE, UV).rgb);
	
	vec3 shadows = step(0.2, smoothstep(0.65, 0.85, texture(shadow_texture, UV).rgb)) * vec3(0.078, 0.380, 0.890);
	float apply = step(0.7, shadows.b);
	
	COLOR = COLOR * (1.0 - apply) + vec4(shadows, apply);
	COLOR.rgb += highlights;
	
}
