event_inherited();
hp = 1;
grav = 0;
collide_damage = 2;
abs_hspeed = 4;
phy_type = phy_types.NEW;
through_walls = true;
audio_play(snd_player_x_shot_2);
animation_init();
animations_init();
animation_add("PW",[
0,0,
3,1,
6,2
],9)