draw_text(48,48,G.playersdetectable);
for(e = 0; e < 32; e++){
	draw_text(16,48 + e * 12,ds_grid_get(G.playersOnline,e,0));
	draw_text(64,48 + e * 12,ds_grid_get(G.playersOnline,e,1));
	draw_text(80,48 + e * 12,ds_grid_get(G.playersOnline,e,2));
	draw_text(96,48 + e * 12,ds_grid_get(G.playersOnline,e,3));
	draw_text(112,48 + e * 12,ds_grid_get(G.playersOnline,e,4));
}