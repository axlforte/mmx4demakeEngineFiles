event_inherited();
hp = 1;
damage_set(0,0,0,0);
damageable = false;
//blocking = array_get([0, 0, 1], global.difficulty);
phy_type = phy_types.NEW;
through_walls = true;
grav = 0;
gravity_default = 0;
got_got = false;
grab_limit = array_get([90, 120, 90, 360], global.difficulty);

abs_speed_max = array_get([5, 5.75, 7.5, 3], global.difficulty);
abs_speed = 1;
acceleration = 0.125;
target = noone;
h_accel = 0;
v_accel = 0;
dir_angle = 0;

shot_type = 2;
homing_limit_min = 2;
homing_limit_max = array_get([35, 45, 80, 10000], global.difficulty);
accel_type = 1;
auto_rotate = false;

persist = true;
dir = 1;