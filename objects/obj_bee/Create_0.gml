#region Variables
event_inherited();
hp = 1;
collide_damage = array_get([1, 2, 3, 128], global.difficulty);
fly_speed = array_get([3.5, 4, 4.5, 7], global.difficulty);
grav = 0;

x_spd = 0;
y_spd = 0;
move_ratio = 0;

state_set(bat.hanging);
#endregion
#region Animations
// Hanging
animation_add("H",
[
	0, 0,
	4, 1,
	8, 2,
	12, 3
], 0, 16);

// Attacking
animation_add("A",
[
	0, 4,
	3, 5, 
	6, 4,
	9, 0, 
	12, 6, 
	15, 7, 
	18, 8
], 18, 19);
#endregion