
event_inherited();

if (destroy)
{
	instance_destroy();
}
else
{
	if(is_on_floor()){
		instance_destroy();
	}
}
