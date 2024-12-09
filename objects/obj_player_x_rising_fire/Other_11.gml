
event_inherited();

if (destroy)
{
	instance_destroy();
}
else
{
	var t = timer++;
	if(t > 4){
		atk = 4;
	}
}
