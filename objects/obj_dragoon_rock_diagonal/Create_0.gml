event_inherited();
hp = 1;
grav = 0;
collide_damage = 2;
abs_hspeed = 4;
v_speed = 3;
phy_type = phy_types.NEW;
through_walls = true;
audio_play(snd_magma_dragoon_fire);
animation_init();
animations_init();
animation_add("PW",[
0,0,
2,1,
4,2,
6,3,
8,4,
10,5,
12,6,
14,7,
16,7
])