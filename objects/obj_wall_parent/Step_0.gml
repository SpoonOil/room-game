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
				
				// Retrieve information on what we would collide with...
				ds_list_clear(collisions_list);
				var _num_cols = instance_place_list(_wall.x + check_vector_x*_j, _wall.y + check_vector_y*_j, [obj_player, obj_pole, obj_box, obj_obstacle], collisions_list, true);
				
				
				// How many objects of interest did we collide with?
				if _num_cols > 1 {
					// In this case, we've collided with two objects
					// One of the objects we've collided with is a submerged box. What's the other object?
					if (object_get_name(collisions_list[| 0].object_index) == "obj_box" && collisions_list[| 0].walkable) {
						var _space = collisions_list[| 1];
					}
					else {
						var _space = collisions_list[| 0];	
					}
				}
				else if _num_cols == 1 {
					// In this case, we collided with ONE object
					var _space = collisions_list[| 0];
				}
				else {
					// In this case, we didn't collide with anything of interest! We can break and check the next object
					break;	
				}
				
				// If we got here when _j = 1 , that means the adjacent space was NOT empty
				// If we got here when _j > 1 , that means the adjacent space was NOT empty AND was occupied by something other than the player
				var _obj_name = object_get_name(_space.object_index);
				if ( (_obj_name == "obj_player") || _obj_name == "obj_pole" || (_obj_name == "obj_obstacle" && _j > 1)) {
					// If the adjacent object is a player on the first check, an obstacle on the second or more check or a pole or an obstacle, we CANNOT move
					can_move = false;
					break;
				}
				else if ((object_get_name(_space.object_index) == "obj_player" && _j > 1) || (object_get_name(_space.object_index) == "obj_box" && _space.walkable)) {
					// If the adjacent object is a player on the 2nd+ check, we can move!
					// If the adjacent object is a submerged box, we can move!
					break;
				}
				else {
					if _obj_name == "obj_obstacle" && _j == 1 {
						break ;	
					} else {
						// In this case, the object in question MUST be a box that is NOT submerged
						// We must check the next object in line
						// While we're doing these checks, I also want to mark ahead of time what boxes need to get moved...
						boxes_to_move[array_length(boxes_to_move)] = _space
						_j++;
					}
				}
			}
	
			if can_move == false {
				// There is no need to continue the check if even *one* wall is unable to be moved in the desired direction
				var _sound_params =
				{
				    sound: snd_move_wall,
				    priority: 100,
				    gain: 1.0
				};
			
				if audio_is_playing(snd_move_wall) {
					audio_stop_sound(wall_sfx);
				}
				wall_sfx = audio_play_sound_ext(_sound_params);
				break;
			}
		}

		if (can_move) {
			// First, let's record the state histories of all the object instances we need to record
			// If necessary, we'll also *move* the object instances in the desired direction 
			
			// First, move all wall objects in the desired direction...
			for (i = 0; i < instance_number(obj_wall);i++) {
				var _wall = instance_find(obj_wall, i);
				state = {
					xpos : _wall.x,
					ypos : _wall.y
				};
				scr_update_state(_wall,state);
				
				_wall.speed = 16;
				_wall.direction = target_direction;
			}
			
			// Next, record the state of all boxes...
			for(i = 0; i < instance_number(obj_box); i++) {
				var _box = instance_find(obj_box, i);
				state = {
					xpos : _box.x,
					ypos : _box.y,
					walkable : _box.walkable
				};
				scr_update_state(_box, state);
			}
			
			// Next, move all eligible boxes in the desired direction...
			for(i = 0; i < array_length(boxes_to_move); i++) {
				var _box = boxes_to_move[i];
				_box.speed = 16;
				_box.direction = target_direction;
			}
			
			// Next, record the state history of all keys
			for (i = 0; i < instance_number(obj_key);i++) {
				var _key = instance_find(obj_key, i);
				scr_update_state(_key, _key.collected);
			}
			
			// Next, record the state history of the player
			// There should only be one instance of the player, this is just "safe" code
			for (i = 0; i < instance_number(obj_player);i++) {
				var _player = instance_find(obj_player, i);
				state = {
					xpos : _player.x,
					ypos : _player.y
				};
				scr_update_state(_player, state);
			}
			
			// Finally, play a sound indicating that we moved the walls
			var _sound_params =
			{
			    sound: snd_move_wall,
			    priority: 100,
			    gain: 1.0
			};
			
			if audio_is_playing(snd_move_wall) {
				audio_stop_sound(wall_sfx);
			}
			wall_sfx = audio_play_sound_ext(_sound_params);
		}
	}
}