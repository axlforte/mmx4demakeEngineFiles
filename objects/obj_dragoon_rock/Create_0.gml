event_inherited();
hp = 1;
grav = 0;
collide_damage = 2;
abs_hspeed = 0;
v_speed = 3.5;
image_frame = 0;
image_yscale = -1;
phy_type = phy_types.NEW;
through_walls = true;
damageable = true;
//audio_play(snd_magma_dragoon_fire);
animation_init();
animations_init();
animation_add("PW",[
0,0,
2,1,
4,2,
6,3,
8,3
])
animation_play("PW");