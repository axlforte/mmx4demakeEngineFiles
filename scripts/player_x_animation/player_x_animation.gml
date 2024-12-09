function player_x_animation() {
	player_animations();

	animation_add("hover");
	animation_add("fly");
	
	animation_add("idle", 
	[
		0, 0,
		7, 1,
		14, 2,
		21, 1,
		28, 0,
	], 0, 35);
	
	animation_add("walk", 
	[
		0, 0,
		3, 1,
		5, 2,
		7, 3,
		9, 4,
		11, 5,
		14, 6,//strech frame
		19, 7,
		23, 8,
		25, 9,
		28, 10,
		30, 11,
		33, 12,// strech frame
		38, 13,
		41, 2
	], 5, 41);
	
	animation_add("dash",
	[
		0, 0,
		2, 1,
		5, 2,
		7, 3,
	], 7);
	
	animation_add("dash_end|dash",
	[
		0, 3,
		2,2,
		5,1,
		8,4,
		15,0
	], 19);

	animation_add("jump",
	[
		0, 7,
		1, 6,
		2, 0,
		4, 1,
		6, 2,
	], 7);
	
	animation_add("fall|jump",
	[
	    0, 2,
	    3, 3,
	    6, 4,
	    9, 5
	], 9);
	
	animation_add("land|jump",
	[
		0, 5,
		2, 6,
		3, 7,
		4, 6
	]);
	
	animation_add("wall_jump|wall",
	[
		0, 3,
		1, 0,
		3, 4,
		5, 5
	], 7);
	animation_add("wall_slide|wall",
	[
		0, 0,
		2, 3,
		4, 1,
		6, 2
	], 6);
	
	animation_add("shoot",
	[ 
	 0,0,
	 2,1,
	 6,0,
	 11,2,
	 13,3
	], 14);

	// Open Arms
	animation_add("open_arms|giga",
	[
		0, 0,
		4, 1,
		8, 2
	], 8);

	animation_add("open_arms_air|giga",
	[
		0, 0,
		4, 1,
		8, 2
	], 8);

	animation_add("dolor",
	[
		0, 0,
		3, 1,
		5, 2,
		7, 3,
		9, 4,
		11, 5,
		13, 1,
		17,2,
		19,1,
		23,2,
		25,1,
		29,2,
		31,1,
		32, 0,
		33, 0
	]);

	animation_add("super_shoot",
	[
		0, 0,
		2, 1,
		4, 2,
		12, 3,
		23, 4,
		33, 5,
		36, 6
	], 36);

	animation_add("super_shoot_c",
	[
		0, 0,
		4, 1,
		12, 2,
		23, 3,
		33, 4,
		36, 5
	], 36);

	animation_add("shoryuken",
	[
		0, 0,
		2, 1,
		4, 2,
		6, 3,
		9, 4,
		11, 4
	], 6, 11);
	
	animation_add("shoryuken_fall|shoryuken",
	[
		0, 5,
		2, 6,
		3, 6
	], 3);
	
	animation_add("shoryuken_end|shoryuken",
	[
		0, 8,
		5, 8
	]);
	// Alt Shoryuken (from X2)
	animation_add("shoryuken2",
	[
		0, 0,
		6, 1,
		8, 2,
		10, 3,
		11, 3
	], 6, 11);
	
	animation_add("shoryuken2_fall|shoryuken2",
	[
		0, 4
	], 0);
	
	animation_add("shoryuken2_end|shoryuken2",
	[
		0, 5,
		5, 5
	]);

	animation_add("hadouken", 
	[
		0, 0,
		6, 1,
		17, 2
	], 17);

	animation_add("hadouken_air", animations_frames[? "hadouken"], 17);

	animation_add("nova_strike",
	[
		0, 0,
		2, 1,
		4, 2,
		8, 3,
		10, 4,
		12, 5,
		13, 6,
		14, 7,
		15, 8
	], 12, 15);

	animation_add("tatsumaki", keyframes_generate(6, 1 / 3));
	animation_add_loop("tatsumaki");

	animation_add("tatsumaki2", animations_frames[? "tatsumaki"]);
	animation_add_loop("tatsumaki2");

	animation_add("ceil",
	[
		0, 0,
		4, 1,
		8, 2,
		12, 3
	], 12);

	animation_add("ceil_shot",
	[
		0, 0,
		8, 1,
		16, 2
	], 16);

	// Saber
	animation_add("atk3",
	[
		0, 0,
		1, 1,
		2, 2,
		3, 3,
		4, 4,
		6, 5,
		7, 6,
		8, 7,
		9, 8,
		11, 9,
		12, 10,
		16, 11,
		19, 11
	]);

	animation_add("atk3_end|atk3",
	[
		0, 12,
		6, 13,
		10, 14,
		14, 15,
		17, 0,
		21, 0
	]);

	animation_add("atk_jump",
	[
		0, 0,
		1, 1,
		2, 2,
		4, 3,
		6, 4,
		8, 5,
		11, 5
	]);

	animation_add("atk_jump_end|atk_jump",
	[
		0, 6,
		2, 7,
		4, 8
	]);

	animation_add("atk_land",
	[
		0, 0,
		1, 1,
		2, 2,
		4, 3,
		6, 4,
		8, 5,
		11, 5
	]);

	animation_add("atk_land_end|atk_land",
	[
		0, 6,
		2, 7,
		4, 8
	]);

	// Giga
	animation_add("giga",
	[
		0, 0,
		4, 1,
		6, 2,
		7, 2
	], 4, 7);

	animation_add("giga_air|giga",
	[
		0, 3,
		4, 4,
		6, 5,
		7, 5
	], 4, 7);

	animation_add("giga_loop|giga",
	[
		0, 6,
		2, 7,
		3, 7
	], 0, 3);

	animation_add("giga_end|giga",
	[
		0, 0,
		2, 0,
	]);


	animation_add("giga_end_air|giga",
	[
		0, 3,
		2, 3
	]);



}
