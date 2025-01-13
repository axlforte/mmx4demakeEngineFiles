function keys_init() {
	enum e_key
	{
		up,
		down,
		left,
		right,
		dash,
		jump,
		shoot,
		shoot2,
		special,
		weapon1,
		weapon2,
		start
	}
	// Key Name
	global.key_text[e_key.up]      = "UP";
	global.key_text[e_key.down]    = "DOWN";
	global.key_text[e_key.left]    = "LEFT";
	global.key_text[e_key.right]   = "RIGHT";
	global.key_text[e_key.dash]    = "DASH";
	global.key_text[e_key.jump]    = "JUMP";
	global.key_text[e_key.shoot]   = "SHOOT";
	global.key_text[e_key.shoot2]  = "SHOOT2";
	global.key_text[e_key.special] = "SPECIAL";
	global.key_text[e_key.weapon1] = "WEAPON1";
	global.key_text[e_key.weapon2] = "WEAPON2";
	global.key_text[e_key.start]   = "MENU";
	// Keyboard
	global.key_config[e_key.up]      = ord("W");
	global.key_config[e_key.down]    = ord("S");
	global.key_config[e_key.left]    = ord("A");
	global.key_config[e_key.right]   = ord("D");
	global.key_config[e_key.dash]    = ord("L");
	global.key_config[e_key.jump]    = ord("K");
	global.key_config[e_key.shoot]   = ord("J");
	global.key_config[e_key.shoot2]  = ord("I");
	global.key_config[e_key.special] = ord("U");
	global.key_config[e_key.weapon1] = ord("O");
	global.key_config[e_key.weapon2] = ord("P");
	global.key_config[e_key.start]   = vk_enter;
	// Gamepad
	global.gamepad_config[e_key.up]      = gp_padu;
	global.gamepad_config[e_key.down]    = gp_padd;
	global.gamepad_config[e_key.left]    = gp_padl;
	global.gamepad_config[e_key.right]   = gp_padr;
	global.gamepad_config[e_key.dash]    = gp_shoulderr;
	global.gamepad_config[e_key.jump]    = gp_face1;
	global.gamepad_config[e_key.shoot]   = gp_face3;
	global.gamepad_config[e_key.shoot2]  = gp_face4;
	global.gamepad_config[e_key.special] = gp_face2;
	global.gamepad_config[e_key.weapon1] = gp_shoulderl;
	global.gamepad_config[e_key.weapon2] = gp_shoulderlb;
	global.gamepad_config[e_key.start]   = gp_start;

	// Initialize Variables using Apply
	keys_apply();

	// Use this to reset the keys
	global.key_config_default     = global.key_config;
	global.gamepad_config_default = global.gamepad_config;


}
