if (ignore_draw) exit;
draw_set_damage_effect(true);
palette_reset();
draw_enemy();
palette_shader();
draw_set_damage_effect(false);