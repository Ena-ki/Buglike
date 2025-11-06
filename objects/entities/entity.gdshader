shader_type canvas_item;

uniform int is_invulnderable : hint_range(0,1);


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if(is_invulnderable == 1){
		COLOR.rgb *= sin(TIME * 20.0) + 2.0;
	}
	else if(is_invulnderable == 2){
		COLOR.rgba *= 0.3;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
