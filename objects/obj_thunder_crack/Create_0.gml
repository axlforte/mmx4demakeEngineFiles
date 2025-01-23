event_inherited();
hp = 1;
damage_set(2, 4, 7, 128);
abs_hspeed = 0
v_speed = 6;
damageable = false;
t = 0;
blocking = true;
shot_type = 0;
grav = 0;
//phy_type = phy_types.NEW;
through_walls = true;
audio_play(snd_thunder);
animation_add("whobble",[
 0, 0,
 2, 1, 
 4, 2, 
 6, 3,
 8, 3
])