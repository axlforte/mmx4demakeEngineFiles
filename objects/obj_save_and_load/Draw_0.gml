draw_sprite_ext(spr_square_16,0,x-160,y-128,32,32,0,c_white,1)
draw_sprite_ext(save_bg, 0, x + (slerp * (save_offset/s_timer)) * s_dir, y,1,1,0,c_white,(s_timer - slerp) / s_timer);
draw_sprite_ext(save_bg, 0, x + (slerp * (save_offset/s_timer) - save_offset) * s_dir, y,1,1,0,c_white,slerp / s_timer);

draw_string(x,y - 64, string(index), colors.orange)
draw_string(x + 24,y - 28, string(shit[12 + (save_length * index)]), colors.purple)
draw_string(x - 64,y + 8, string(shit[13 + (save_length * index)]) , colors.pink)
draw_string(x - 64,y + 16, string(shit[14 + (save_length * index)]), colors.red)
draw_sprite(spr_x_idle, 0, x + player_x,y + player_y);
if(shit[0 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + player_x,y + player_y);}
if(shit[14 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + player_x,y + player_y);}
if(shit[2 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + player_x,y + player_y);}
if(shit[3 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + player_x,y + player_y);}
if(shit[4 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + boss_icon_data[0], y + boss_icon_data[4]);}
if(shit[5 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + boss_icon_data[1], y + boss_icon_data[4]);}
if(shit[6 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + boss_icon_data[2], y + boss_icon_data[4]);}
if(shit[7 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + boss_icon_data[3], y + boss_icon_data[4]);}
if(shit[8 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + boss_icon_data[0], y + boss_icon_data[5]);}
if(shit[9 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + boss_icon_data[1], y + boss_icon_data[5]);}
if(shit[10 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + boss_icon_data[2], y + boss_icon_data[5]);}
if(shit[11 + (save_length * index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + boss_icon_data[3], y + boss_icon_data[5]);}
if(shit[15 + (save_length * index)] == true){
	draw_sprite(tansks2, 0, x - 16, y + 12);}
if(shit[16 + (save_length * index)] == true){
	draw_sprite(tansks2, 0, x + 12, y + 12);}
if(shit[17 + (save_length * index)] == true){
	draw_sprite(tansks1, 0, x + 40, y + 12);}
	
	
draw_sprite(spr_x_idle, 0, x + save_offset,y + player_y);
if(shit[0 + (save_length * p_index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + save_offset,y + player_y);}
if(shit[1 + (save_length * p_index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + save_offset,y + player_y);}
if(shit[2 + (save_length * p_index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + save_offset,y + player_y);}
if(shit[3 + (save_length * p_index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + save_offset,y + player_y);}
	
	
draw_sprite(spr_x_idle, 0, x + save_offset * -1,y + player_y);
if(shit[0 + (save_length * n_index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + save_offset * -1,y + player_y);}
if(shit[1 + (save_length * n_index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + save_offset * -1,y + player_y);}
if(shit[2 + (save_length * n_index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + save_offset * -1,y + player_y);}
if(shit[3 + (save_length * n_index)] == true){
	draw_sprite(spr_maverickscrap_01, 0, x + save_offset * -1,y + player_y);}