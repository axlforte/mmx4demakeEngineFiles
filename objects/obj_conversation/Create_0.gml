conversation = [//you must have a /n between every 40 characters. 
"000you seem to have forgotten to add any/ndialouge to this conversation!",
"001go to the object that initiated this/nconversation object and fix it!",
"000until then make /sabsolute/d sure that/n this works /oproperly/d!"];
// the /n line is new line
// the /d line is default text effect
// the /s line is shaky text
// the /o line makes the text go up and down slowly
//the 2 numbers at the start determine the mugshots used!
//the third number determines the talker, 0 for left and 1 for right
pause_set(!global.paused, pause_types.dialouge);
dspeed = global.DialougeSpeed;
index = -1;
dilog = instance_create_depth(x + 4,y + 4,-100, obj_dialouge);
dilog.delay = 30;
dilog.line = "";
activate = false;
keys_init();
keys_apply();
scr_keys_reset();
alarm[0] = 1;
visible = false;