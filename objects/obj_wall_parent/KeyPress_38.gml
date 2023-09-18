if (global.move_mode = "room") {
	direction = 90
	speed = 16;

	var _space = instance_place(x, y-16, [obj_square]);
	var _i = 1
	while (_space) {
		_space.speed = 16;
		_space.direction = direction;
		_i++;
		_space = instance_place(x, y-16*_i, [obj_square]);
	}
}