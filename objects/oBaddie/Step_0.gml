/// @description  Check the direction of the baddie. 

if xp > x
{
if sprite_index != walk_left sprite_index = walk_left;
}
else
{
if sprite_index != walk_right sprite_index = walk_right;
}
xp = x;

// If we've been hit, this means we're no longer 
// following a path, so bounce him off sctreen!
if hit 
{
x = x + dirspeed;
y = y + grav;
grav += 0.4;
if grav >= 10 grav = 10;
// Once we've fallen below the room, kill him!
if y > room_height instance_destroy();
}



