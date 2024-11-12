/// @description  Kill baddie when player hits it!

// Make sure we're not colliding over and over again!
if hit exit;

// Kill the path we're following.
path_end();

// Flag as hit, and set the gravity mover to UP.
hit = true;
grav = -8;

// Bounce in the correct direction.
if other.x > x
{
dirspeed = -4;
}
else
{
dirspeed = 4;
}





