y += v_speed;
v_speed -= v_speed / v_falloff;

if(tim > fadeTime) { 
	instance_destroy();
} else {
	tim ++;
}