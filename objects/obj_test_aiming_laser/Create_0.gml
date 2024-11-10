event_inherited();
x_fuzz = 8;
y_fuzz = 8;

angle = 0;
l = 0;
t = 0;

angle_dist = 96;
keys_init();

enum lockon {
	unlocked,
	locked
};

state = lockon.unlocked;