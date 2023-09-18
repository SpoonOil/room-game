direction = 90
speed = 16;

var _space = instance_place(x, y-16, obj_square);

if (_space) {
	_space.speed = 16
	_space.direction = direction
}