// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision_check(_xpos, _ypos, _direction, _move_speed){
	
	cols = ds_list_create();
	
	if _direction == 0 {
		x_vec = 16;
		y_vec = 0;
	}
	else if _direction == 90 {
		x_vec = 0;
		y_vec = -16;
	}
	else if _direction == 180 {
		x_vec = -16;
		y_vec = 0;
	}
	else if _direction == 270 {
		x_vec = 0;
		y_vec = 16;
	}
	
	// By default, we allow the player to move unless we see that he can't
	speed_val = _move_speed;
	
	// Will the player collide with anything that unconditionally prevents movement?
	if place_meeting(_xpos + x_vec, _ypos + y_vec, [obj_wall, obj_obstacle, obj_spike, obj_pole]) {
		// Yes. In this case, do not allow the player to move.
		speed_val = 0;
	} else { 
		// No. In this case, we still need to check collisions with respect to water and boxes.
		// Will the player collide with water?
		if place_meeting(_xpos + x_vec, _ypos + y_vec, obj_water){
			// Yes, the player will collide with water
			// Do NOT allow the player to move if he is also set to collide with either 0 or 2 boxes
			_box_count = instance_place_list(_xpos + x_vec, _ypos + y_vec, obj_box, cols, true);
			if _box_count != 1 {
				speed_val = 0;	
			}
		}
		else {
			// No the player will NOT collide with water
			// If the player collides with a box at this point, he WON'T be able to move
			if place_meeting(_xpos + x_vec, _ypos + y_vec, obj_box) {
				speed_val = 0;	
			}
		}
	}
	ds_list_clear(cols);
	ds_list_destroy(cols);
	
	return speed_val;
}