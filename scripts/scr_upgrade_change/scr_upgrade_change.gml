function upgrade_change(){
	var index = -1;
	for(i = 0; i < array_length(global.upgrade_names); i++){
		if(argument[0] == global.upgrade_names[i]){
			index = i;
		}
	}
	
	if(argument[0] == true){
		return true;
	} else if(argument[1] != "get"){
		if(index == 0){
			global.super_dash = argument[1];
		} else if(index == 1){
			 global.hyper_dash = argument[1];
		} else if(index == 2){
			 global.buster_specialist = argument[1];
		} else if(index == 3){
			 global.wall_cling = argument[1];
		} else if(index == 4){
			 global.auto_charge = argument[1];
		} else if(index == 5){
			 global.super_charge = argument[1];
		} else if(index == 6){
			 global.hyper_charge = argument[1];
		} else if(index == 7){
			 global.energy_expert = argument[1];
		} else if(index == 8){
			 global.weapons_specialist = argument[1];
		} else if(index == 9){
			 global.untouchable = argument[1];
		} else if(index == 10){
			 global.yoga = argument[1];
		} else if(index == 11){
			 global.overcharged_systems = argument[1];
		} else if(index == 12){
			 global.undershirt = argument[1];
		} else if(index == 13){
			 global.energy_infusion = argument[1];
		} else if(index == 14){
			 global.regenerative_capacitors = argument[1];
		} else if(index == 15){
			 global.energy_converter = argument[1];
		} else if(index == 16){
			 global.cardio_training = argument[1];
		} else if(index == 17){
			 global.grip_training = argument[1];
		} else if(index == 18){
			 global.explorers_instinct = argument[1];
		} else if(index == 19){
			 global.travelers_companion = argument[1];
		} else if(index == 20){
			 global.concussive_redirectors = argument[1];
		} else if(index == 21){
			 global.sense_of_duty = argument[1];
		} else { 
			return false;
		}
		return true;
	} else {
		if(index == 0){
			return global.super_dash;
		} else if(index == 1){
			return global.hyper_dash;
		} else if(index == 2){
			return global.buster_specialist;
		} else if(index == 3){
			return global.wall_cling;
		} else if(index == 4){
			return global.auto_charge;
		} else if(index == 5){
			return global.super_charge;
		} else if(index == 6){
			return global.hyper_charge;
		} else if(index == 7){
			return global.energy_expert;
		} else if(index == 8){
			return global.weapons_specialist;
		} else if(index == 9){
			return global.untouchable;
		} else if(index == 10){
			return global.yoga;
		} else if(index == 11){
			return global.overcharged_systems;
		} else if(index == 12){
			return global.undershirt;
		} else if(index == 13){
			return global.energy_infusion;
		} else if(index == 14){
			return global.regenerative_capacitors;
		} else if(index == 15){
			return global.energy_converter;
		} else if(index == 16){
			return global.cardio_training;
		} else if(index == 17){
			return global.grip_training;
		} else if(index == 18){
			return global.explorers_instinct;
		} else if(index == 19){
			return global.travelers_companion;
		} else if(index == 20){
			return global.concussive_redirectors;
		} else if(index == 21){
			return global.sense_of_duty;
		} else { 
			return false;
		}
	}
	return false;
}