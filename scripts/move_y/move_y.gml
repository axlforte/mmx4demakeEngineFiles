function move_y_normal(dist, down_on_slope = true) {
	// It moves the object vertically, and diagonally if there is a ramp
	var result = false;
	var _vspeed = dist;
	var _dir = sign(dist);
	if (dist == 0) return false;
	while (dist != 0) {
		if (abs(dist) > 5)
			_vspeed = 5 * _dir;
		else
			_vspeed = dist;
		dist -= _vspeed;
		// If the path is clear
		if (is_place_free(x, y + _vspeed)) {
		    var _down = false;
		    // If the object is going down the ramp
			if (is_on_slope(0, 2)) {
		        // Remind me to move down after walking
		        _down = down_on_slope;
		    }
		    y += _vspeed;
		    result = true;
		    // Prevent this object from bouncing on the slope
			if (_down && is_on_floor(8))
				move_down();
		} else {
		    // If there is a slope on the way and there is no wall
			var is_slope = is_on_slope(_vspeed, 0);
			var xx = x;
			move_contact_block(0, -8);
			var no_wall = is_place_free(x + _vspeed, y);
			if (is_slope && no_wall) {
		        y += _vspeed;
		        result = true;
		        move_down();
		    } else {
		        var _y = y;
				x = xx;
				move_contact_block(_vspeed, 0, 0.5);
		        result |= (y != _y);
		    }
		}
	}
	return result;
}
