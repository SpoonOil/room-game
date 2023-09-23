/// @description Insert description here
// You can write your code in this editor
speed = 0;

// Check if the box moved on top of water. 
if place_meeting(x,y,obj_water) {
	// Are we currently on top of another box?
	if !place_meeting(x,y, obj_box) {
		image_index = 1;
		walkable = true;
		depth = 1;
	}
}








