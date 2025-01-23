#region Variables
event_inherited();
hp = 5;
collide_damage = 1;
grav = 0;
state_set(falling_block.hold);
#endregion
animation_add("hold",[0,0]);
animation_play("hold")