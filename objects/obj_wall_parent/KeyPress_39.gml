direction = 0
speed = 16;

var _space = instance_place(x+16, y, obj_square);

if (_space) {
	_space.speed = 16
	_space.direction = direction
}