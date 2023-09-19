/// @description Insert description here
// You can write your code in this editor

// Destroy *all* instances of obj_camera
// In reality there should only be one, so this is admittedly overkill
for (i = 0; i < instance_number(obj_camera); i++) {
	var _camera = instance_find(obj_camera, i);
	instance_destroy(_camera);
}









