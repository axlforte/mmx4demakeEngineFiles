event_inherited();
var myPlayer = instance_nearest(x, y, obj_player_parent);
if(instance_place(x,y,obj_player_x_rising_fire)){
	damageable = true;
} else {
	damageable = false;
}