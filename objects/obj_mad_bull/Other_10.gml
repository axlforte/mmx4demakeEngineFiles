enum mad_bull { shieldUp, shieldDown };

#region States
var t = state_timer++;

// Cambiar el estado y el sprite cuando la vida (hp) esté en 4 o menos
if (hp <= 4 && state != mad_bull.shieldDown) {
    shieldDown = true;  // Indicar que el escudo está abajo
    state_set(mad_bull.shieldDown);  // Cambiar al estado de escudo abajo
    sprite_index = spr_mad_bull_car;  // Cambiar sprite a spr_mad_bull_car
}

switch(state) {
    #region Estado escudo arriba
    case mad_bull.shieldUp:
        animation_play("SA"); // Reproducir animación de escudo arriba
        sprite_index = spr_mad_bull_spike; // Sprite del escudo arriba
        break;
    #endregion
    
    #region Estado escudo abajo
    case mad_bull.shieldDown:
        animation_play("BA"); // Reproducir animación de escudo abajo
        sprite_index = spr_mad_bull_car;  // Sprite del escudo abajo
        // Puedes agregar aquí más lógica para la fase 2 del enemigo (e.g., aumento de velocidad)
        break;
    #endregion
}
#endregion
