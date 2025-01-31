if (wait_timer > 0) {
	wait_timer--;
	visible = false;
	exit;
}
// Animation
var t = animation_t;

x = __view_get(e__VW.XView, obj_camera_rds.view_id) + global.view_width / 2;
y = __view_get(e__VW.YView, obj_camera_rds.view_id) + global.view_height / 2;

if (t >= 0 && t <= 25) {
    image_index = t div 2;
	visible = true;
}

if (t >= 70) {
    visible = (((t - 35) mod 2) > 0);
} else if (t >= 47) {
    visible = (((t - 35) mod 3) > 0);
} else if (t >= 35) {
    visible = (((t - 35) mod 4) > 0);
}

if (t == 83) {
	if (instance_exists(obj_player_parent)) {
		//obj_player_parent.state = states.intro;	
	}
	instance_destroy();
	exit;
}

if(t == 5){
	audio_play(snd_ready_mmx4);
}

animation_t++;