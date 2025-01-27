//Initialize our fields
gamma = 0.5;        // Range 0-1  -> 0 is totally bright
crt = true;    // CRT overlay

//Surfaces are the same size as display
surf_gamma = surface_create(window_get_width(), window_get_height());
surf_crt = surface_create(window_get_width(), window_get_height());


//Setup gamma surface
surface_set_target(surf_gamma);
draw_sprite_tiled_ext(spr_pixel, 0, x, 0, 0.5, 0.5, c_black, 1);      //This is the "magic" function

surface_reset_target();

//Setup CRT surface
surface_set_target(surf_crt);
draw_sprite_tiled_ext(spr_crt, 0, x, 0, 0.5, 0.5, c_black, 1);      //This is the "magic" function
surface_reset_target();

scr_keys_reset();