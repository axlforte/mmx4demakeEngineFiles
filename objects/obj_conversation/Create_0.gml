conversation = [
"000you seem to have forgotten to add any/ndialouge to this conversation!",
"001go to the object that initiated this/nconversation object and fix it!",
"000until then make /sabsolute/d sure that/n this works /oproperly/d!"];
// the /n line is new line
// the /d line is default text effect
// the /s line is shaky text
// the /o line makes the text go up and down slowly
//the 2 numbers at the start determine the mugshots used!
//the third number determines the talker, 0 for left and 1 for right
dspeed = global.DialougeSpeed;
index = 0;
dilog = instance_create_depth(x,y,-100, obj_dialouge);
dilog.line = array_get(conversation, 0);
keys_init();
keys_apply();