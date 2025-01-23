event_inherited();
enum wrecker { 
	roll,
	walk,
	decide
	};
#region States
var t = state_timer++;
switch(state) {
	#region Roll forwards! it worked for sonic!
	case wrecker.roll:
		if(t == 0){
			animation_play("T");
		}
		if(t == 10){
			h_speed = 3 * dir;
			damageable = false;
		}
		if(t == 30){
			damageable = true;
			state_set(wrecker.decide);
		}
		break;
	#endregion
	
	#region i cant beat the shit out of you without getting closer
	case wrecker.walk:
		if(t == 0){
			h_speed = 1 * dir;
			animation_play("W");
		}
		if(t == 60){
			state_set(wrecker.decide);
			animation_play("S")
		}
		break;
	#endregion
	
	#region should I go towards x faster or slower
	case wrecker.decide:
		if(t == 0){
			h_speed = 0;
			face_x = true;
		}
		
		if(t == 10){
			animation_play("S")
			face_x = false;
		}
		
		if(t == array_get([35,30,25,11], global.difficulty)){
			if(abs(DPX) < 96){
				state_set(wrecker.roll);
			} else {
				state_set(wrecker.walk);
			}
		}
	#endregion
}
xscale = -dir;
#endregion