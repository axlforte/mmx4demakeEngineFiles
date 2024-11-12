/// @description  Initialise the baddie.
if global.haveserver == false
	{
    instance_destroy();
    exit;
	}

xp = -1;
image_speed = 0.5;
hit = false;
grav = 0;
dirspeed = 0;
global.BaddieCount++;

// There is also some creation code inside the ROOM which sets up the path and colour.
// To see this, right click the instance in the map and select "creation code"


