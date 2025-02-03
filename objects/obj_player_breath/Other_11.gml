// Destroy
y -= 1.5;
if (place_meeting(x, y, obj_block_parent) || !place_meeting(x, y, obj_water)) {
    instance_destroy();
}