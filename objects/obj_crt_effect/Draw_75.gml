//CRT overlay
if(crt){
    if(surface_exists(surf_crt)){
        draw_surface(surf_crt, 0, 0);
    }
    else {
        surf_crt = surface_create(window_get_width(), window_get_height());
        surface_set_target(surf_crt);
        draw_sprite_tiled_ext(spr_crt, 0, 0, 0, 0.5, 0.5, c_black, 1);      //This is the "magic" function
        surface_reset_target();
        draw_surface(surf_crt, 0, 0);
    }
}

//Set our draw alpha to our gamma
draw_set_alpha(gamma);

//Draw the GAMMA overlay
if(surface_exists(surf_gamma)){
    draw_surface(surf_gamma, 0, 0);
} else {
    surf_gamma = surface_create(window_get_width(), window_get_height());
    surface_set_target(surf_gamma);
    draw_sprite_tiled_ext(spr_pixel, 0, 0, 0, 0.5, 0.5, c_black, 1);      //This is the "magic" function
    surface_reset_target();
    draw_surface(surf_gamma, 0, 0);
}

//Reset our draw alpha
draw_set_alpha(1);

//Debug values
var _crt = crt ? "True" : "False";
draw_text(32, 32, "CRT: " + _crt);
draw_text(32, 48, "Gamma: " + string(gamma));