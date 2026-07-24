shader_type canvas_item;

//noise texture
uniform sampler2D noise_texture: repeat_enable,filter_nearest;

//fog density
uniform float density: hint_range(0.0,1.0) = 0.55;

//fog speed
uniform vec2 speed = vec2(0.02,0.01);

void fragment() {
	//make fog slowly move
	vec2 uv = UV + speed * TIME;
	//  sample the noise texture
	float noise = texture(noise_texture, uv).r;
	//convert the noise from the (0.0, 1.0) range to the (-1.0,1.0) range
	// and clamp it between 0.0 and 1.0 again
	float fog = clamp(noise * 2.5-1.0,0.0,1.5);
	// apply fog effect
	COLOR.a *= fog* density;
	COLOR.rgb = vec3(1.0,1.0,1.0);
}
