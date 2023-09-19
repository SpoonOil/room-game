// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision_check(_instance, _direction){
	
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
	
	// By default, we disallow the player from moving unless we see that it's possible to allow him to move
	speed_val = 0;
	
	// Will the player collide with *anything*?
	if !place_meeting(_instance.x + x_vec, _instance.y+y_vec, all) {
		// No, the player will not. He is able to move.
		speed_val = 16;
	}
	// Yes, the player will collide with something.
	// Is one of those somethings a box?
	else if place_meeting(_instance.x+x_vec, _instance.y+y_vec, obj_box){
		// Yes, the player is set to collide with a box
		// Allow the player to move provided that he is set to collide with just ONE box and that box is walkable
		_box_count = instance_place_list(_instance.x+x_vec,_instance.y+y_vec, obj_box, cols, true);
		if _box_count == 1 && cols[| 0].walkable {
			speed_val = 16;	
		}
	}
	// No, the player will not collide with a box
	// Will they collide with a hole?
	else if place_meeting(_instance.x+x_vec, _instance.y+y_vec, obj_hole) {
		// Yes, they will!
		speed_val = 16;
	}
	
	ds_list_clear(cols);
	ds_list_destroy(cols);
	
	return speed_val;
}