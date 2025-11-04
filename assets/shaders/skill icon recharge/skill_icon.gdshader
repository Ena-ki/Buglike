shader_type canvas_item;

uniform float cooldown : hint_range(0,1);

void vertex() {
	
}

void fragment() {
	if (UV.y < cooldown){
		COLOR.rgb *= 0.3;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
