if (global.move_mode = "room") {
	direction = 0
	speed = 16;

	var _space = instance_place(x+16, y, [obj_square]);
	var _i = 1
	while (_space) {
		_space.speed = 16;
		_space.direction = direction;
		_i++;
		_space = instance_place(x+16*_i, y, [obj_square]);
	}
}