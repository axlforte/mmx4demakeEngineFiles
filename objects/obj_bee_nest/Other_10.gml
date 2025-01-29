#region States
var t = state_timer++;
switch(state) {
    #region standin around
    case giga_death.idle:
		if(t > array_get([180, 120, 100, 80], global.difficulty)){
			state_set(giga_death.shoot);
		}
        break;
    #endregion
    
    #region pew
    case giga_death.shoot:
			instance_create_depth(x + 40, y + 16, depth - 1, obj_bee);
			instance_create_depth(x + 44, y + 8, depth - 1, obj_bee);
			instance_create_depth(x + 41, y, depth - 1, obj_bee);
			instance_create_depth(x + 43, y - 8, depth - 1, obj_bee);
			instance_create_depth(x + 39, y - 16, depth - 1, obj_bee);
			instance_create_depth(x - 40, y + 16, depth - 1, obj_bee);
			instance_create_depth(x - 44, y + 8, depth - 1, obj_bee);
			instance_create_depth(x - 41, y, depth - 1, obj_bee);
			instance_create_depth(x - 43, y - 8, depth - 1, obj_bee);
			instance_create_depth(x - 39, y - 16, depth - 1, obj_bee);
			state_set(giga_death.idle);
        break;
    #endregion
}
#endregion
