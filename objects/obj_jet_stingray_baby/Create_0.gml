event_inherited();
hp = 1;
type = 1;
damage_set(2, 4, 6);
abs_hspeed = array_get([4, 5, 7], global.difficulty);
damageable = false;
blocking = array_get([0, 1, 1], global.difficulty);
shot_type = 0;
phy_type = phy_types.NEW;
through_walls = false;
audio_play(snd_ice_shot);
image_index = 1;

if(type == 2){
	image_index = 3;
}