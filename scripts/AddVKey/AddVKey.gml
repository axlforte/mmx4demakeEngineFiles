/// @function				AddVKey(key);
/// @param	{inst}	key		The key value to map to the virtual key
function AddVKey(argument0) {

	/// @description			Adds a virtual key on the target platforms that need them


	if os_type == os_macosx || os_type == os_windows || os_type == os_linux
	{
	instance_destroy();
	return -1;
	}
	else
	{
	return virtual_key_add(x, y, sprite_get_width(sprite_index) * image_xscale, sprite_get_height(sprite_index) * image_yscale, argument0);
	}





}
