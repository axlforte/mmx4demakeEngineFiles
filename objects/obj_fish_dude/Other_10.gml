event_inherited();
enum poseidon { stand, yeet, shit};
#region States
var t = state_timer++;

switch(state) {
	#region Stand
	case poseidon.stand:
			animation_play("S");
		if(random_range(0,10) < 6)
			state_set(poseidon.shit);
		else
			state_set(poseidon.yeet);
		break;
	#endregion
	#region Throw Pickaxe
	case poseidon.yeet:
		if(t == 1){
			grav = 0;
			v_speed = 6;
			animation_play("T");
			y -= 8;
		}
		if (t == 30) {
			v_speed = 0;
			grav = 0;
			
			var p = instance_create_depth(x + 19*dir, y, depth - 1, obj_fish_spine);
			p.h_speed = 3 * dir;
			p.v_speed = 0;
			p.xscale = dir;
			p.owner = id;
			p = instance_create_depth(x + 19*dir, y, depth - 1, obj_fish_spine);
			p.h_speed = 2 * dir;
			p.v_speed = 2;
			p.xscale = dir;
			p.owner = id;
			p.spit = fish_needles3;
			p = instance_create_depth(x + 19*dir, y, depth - 1, obj_fish_spine);
			p.h_speed = 0 * dir;
			p.v_speed = 3;
			p.xscale = dir;
			p.owner = id;
			p.spit = fish_needles5;
		}
		if (t == 45){
			grav = 1;
		}
		if(t == 82){
			state_set(poseidon.stand);
		}
		break;
	#endregion
	#region Laugh
	case poseidon.shit:
		animation_play("L");
		if(t == 1){
			var p = instance_create_depth(x + 19*dir, y - 8, depth - 1, obj_fish_spine);
			p.h_speed = 2 * dir;
			p.v_speed = 0;
			p.xscale = dir;
			p.owner = id;
			p = instance_create_depth(x + 19*dir, y, depth - 1, obj_fish_spine);
			p.h_speed = 2 * dir;
			p.v_speed = 0;
			p.xscale = dir;
			p.owner = id;
			p = instance_create_depth(x + 19*dir, y + 8, depth - 1, obj_fish_spine);
			p.h_speed = 2 * dir;
			p.v_speed = 0;
			p.xscale = dir;
			p.owner = id;
		}
		if (t >= 50)
			state_set(poseidon.stand);
		break;
	#endregion
}
#endregion