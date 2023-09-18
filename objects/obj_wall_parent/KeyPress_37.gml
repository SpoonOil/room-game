if (global.move_mode = "room") {
	var _space = instance_place(x-16, y, [obj_square]);
	if !(_space = noone) {
		var _obj_name = object_get_name(_space.object_index);
	} else {
		var _obj_name = "none"
	}
	if !(_obj_name == "obj_player") {
		direction = 180;
		speed = 16;
		var _i = 1
		while (_space) {
			_space.speed = 16;
			_space.direction = direction;
			_i++;
			_space = instance_place(x-16*_i, y, [obj_square]);
		}
	}
}