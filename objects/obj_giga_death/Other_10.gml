enum giga_death { idle, shoot };

#region States
var t = state_timer++;
switch(state) {
    #region standin around
    case giga_death.idle:
		if(t > 120){
			state_set(giga_death.shoot);
		}
        break;
    #endregion
    
    #region pew
    case giga_death.shoot:
			var p = instance_create_depth(x + 40*dir, y, depth - 1, obj_giga_death_missile);
			p.h_speed = 3 * dir;
			p.dir = dir;
			p.xscale = dir * -1;
			p.owner = id;
			state_set(giga_death.idle);
        break;
    #endregion
}
#endregion
