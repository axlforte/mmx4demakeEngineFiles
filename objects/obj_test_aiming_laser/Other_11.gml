var myPlayer = instance_nearest(x, y, obj_player_parent);

if(state == lockon.unlocked){
	x = G.player_x;
	y = G.player_y;

	

	scr_keys_reset();
	scr_keys_update();

	if(key_down && angle > -60){
		angle -= 1;
	} else if(key_up && angle < 60){
		angle += 1;
	}

	x += sin((angle + 90) * myPlayer.dir * pi / 180) * angle_dist;
	y += cos((angle + 90) * myPlayer.dir * pi / 180) * angle_dist;

	if(myPlayer.dash){
		l += 2;
	} else if (myPlayer.walk){
		l += 1;
	}
	l += 1;

	if(l > 360){
		l = 0;
	}

	var closestEnemy = instance_nearest(x, y, par_enemy);

	if(closestEnemy != noone){
		if(abs(closestEnemy.x - x) < 16){
			if(abs(closestEnemy.y - y) < 16){
				state = lockon.locked;
			}
		}
	}
} else {
	var closestEnemy = instance_nearest(x, y, par_enemy);
	
	if(closestEnemy == noone){
		state = lockon.unlocked;
		return;
	}
	
	x = closestEnemy.x;
	y = closestEnemy.y;
	l += 1;

	if(l > 60){
		var shot = instance_create_depth(x,y,0,obj_player_x_shot_1);
		shot.dir = 1;
		l = 0;
	}
}

t += 1;

if(t > 720 || myPlayer.current_weapon != weapons.aiming_laser){
	instance_destroy();
}