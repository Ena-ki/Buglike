shader_type canvas_item;

uniform int is_invulnderable : hint_range(0,1);


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if(is_invulnderable > 0){
		COLOR.rgb *= sin(TIME * 20.0) + 2.0;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
