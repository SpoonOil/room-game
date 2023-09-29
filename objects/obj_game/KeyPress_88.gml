/// @description Insert description here
// You can write your code in this editor

//Undo feature
if obj_player.current_state > 0 {
	obj_arr = [obj_wall, obj_box, obj_player, obj_key];
	for (i = 0; i < array_length(obj_arr); i++) {
		for (j = 0; j < instance_number(obj_arr[i]);j++) {
			var _obj = instance_find(obj_arr[i], j);
			state = scr_revert_state(_obj);
		
			if i != 3 {
				// If the object is NOT a key...
				_obj.x = state.xpos;
				_obj.y = state.ypos;
			} else {
				// If the object IS a key...
				_obj.collected = state;
			}
		
			if i == 1 {
				// If the object is a box...
				_obj.walkable = state.walkable;
			}
		
		}
	}
}










