var myPlayer = instance_nearest(x, y, obj_player_parent);
if(state = lockon.unlocked){
draw_triangle_color(
 myPlayer.x,myPlayer.y,
 myPlayer.x + (sin((angle + 60) * myPlayer.dir * pi / 180) * angle_dist * 0.75),
 myPlayer.y + (cos((angle + 60) * myPlayer.dir * pi / 180) * angle_dist * 0.75),
 x,y,
 c_purple,
 c_blue,
 c_teal,
 false
);
draw_triangle_color(
 myPlayer.x,myPlayer.y,
 myPlayer.x + (sin((angle + 120) * myPlayer.dir * pi / 180) * angle_dist * 0.75),
 myPlayer.y + (cos((angle + 120) * myPlayer.dir * pi / 180) * angle_dist * 0.75),
 x,y,
 c_purple,
 c_blue,
 c_teal,
 false
);}

draw_sprite_ext(spr_aim_laser_square,0,x,y,1,1,l,c_white,1);
draw_sprite(spr_aim_laser_reticle,0,x,y);