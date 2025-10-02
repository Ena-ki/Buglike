shader_type canvas_item;

uniform float cooldown : hint_range(0,1);

void vertex() {
	
}

void fragment() {
	vec2 uv = UV;
	if (uv.y < cooldown){
		COLOR = COLOR * 0.3;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
