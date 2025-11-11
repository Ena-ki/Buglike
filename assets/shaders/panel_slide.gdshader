shader_type canvas_item;

void vertex() {
	UV = UV + TIME * 0.3;
}

void fragment() {
  int cell_size = 100;
	vec4 col1 = vec4(0.984, 0.800, 0.443,1.0);
	vec4 col2 = vec4(0.906, 0.392, 0.345, 1.0);
	bool yes = false;
	if(int(FRAGCOORD.x+ TIME * 23.0) % cell_size * 2 >= cell_size){
		yes = !yes;
	}
	if(int(FRAGCOORD.y + TIME * 23.0) % cell_size * 2 >= cell_size ){
		yes = !yes;
	}
	if(yes)
		COLOR = col1;
	else
		COLOR = col2;

}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
