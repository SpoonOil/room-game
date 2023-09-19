/// @description logic for moving walls
// You can write your code in this editor

if (global.move_mode = "room") {
	
	// Get key inputs
	// LASER'S NOTE: The else if statements prevent the game from trying to process two+ directions simultaneously
	
	try_to_move = false;
	if keyboard_check_pressed(vk_right) {
		target_direction = 0;	
		check_vector_x = 16;
		check_vector_y = 0;
		try_to_move = true;
	}
	else if keyboard_check_pressed(vk_up) {
		target_direction = 90;	
		check_vector_x = 0;
		check_vector_y = -16;
		try_to_move = true;
	}
	else if keyboard_check_pressed(vk_left) {
		target_direction = 180;
		check_vector_x = -16;
		check_vector_y = 0;
		try_to_move = true;
	}
	else if keyboard_check_pressed(vk_down) {
		target_direction = 270;	
		check_vector_x = 0;
		check_vector_y = 16;
		try_to_move = true;
	}

	// Don't try to move walls unless we actually get a key input...
	if (try_to_move) {
		boxes_to_move = [];
		can_move = true;
		for (i = 0; i < instance_number(obj_wall);i++)
		{
			// Wall information
			var _wall = instance_find(obj_wall, i);
	
			// Check whether the given wall is able to move in the desired direction...
			var _j = 1;
			while true {
				var _space = instance_place(_wall.x + check_vector_x*_j, _wall.y + check_vector_y*_j, [obj_player, obj_pole, obj_square]);
				
				if (_space == noone || (object_get_name(_space.object_index) == "obj_player" && _j > 1) || object_get_name(_space.object_index) == "obj_wall" ) {
					// Either there is an immediate empty space OR a player at the end of a line of boxes OR a wall tile
					// YES, this wall tile can move, so we can move on to checking the next wall instance
					break;	
				}
				else {
					// If we got here when _j = 1 , that means the adjacent space was NOT empty
					// If we got here when _j > 1 , that means the adjacent space was NOT empty AND was occupied by something other than the player
					var _obj_name = object_get_name(_space.object_index);
					if ( (_obj_name == "obj_player" && _j == 1) || _obj_name == "obj_pole") {
						// If the adjacent object is a player on the first check or a pole, we CANNOT move
						can_move = false;
						break
					}
					else {
						// In this case, the object in question MUST be a box
						// We must check the next object in line
						// While we're doing these checks, I also want to mark ahead of time what boxes need to get moved...
						boxes_to_move[array_length(boxes_to_move)] = _space
						_j++;
					}
				}
			}
	
			if can_move == false {
				// There is no need to continue the check if even *one* wall is unable to be moved in the desired direction
				break;
			}
		}

		if (can_move) {
			// First, move all wall objects in the desired direction...
	
			for (i = 0; i < instance_number(obj_wall);i++) {
				var _wall = instance_find(obj_wall, i);
				_wall.speed = 16;
				_wall.direction = target_direction;
			}
	
			// Next, move all eligible boxes in the desired direction...
			for(i = 0; i < array_length(boxes_to_move); i++) {
				boxes_to_move[i].speed = 16
				boxes_to_move[i].direction = target_direction;
			}
		}
		else
		{
			var _fake = 0;	
		}
	}
}