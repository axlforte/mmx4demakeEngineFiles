alarm[0] = 1;
check_phase = 0;
//Armor check for capsules;
armor_check = 0;

if(global.mp){
	instance_create_depth(x,y,-600,oClient);
}