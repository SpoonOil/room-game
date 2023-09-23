/// @description Insert description here
// You can write your code in this editor

// Before opening the hole, make sure the player has collected all keys and that all pressure plates are in a depressed state

image_index = 0; // We want to try to open the hole, but if a false flag comes up, we'll determine it to be closed by the end of this step code.

// Are there any keys left to collect?
if instance_number(obj_key) > 0 {
	// Yes there are, close the hole
	image_index = 1;
}
else {
	// No, there aren't. Let's check that all plate objects are in a depressed state.
	for (i = 0; i < instance_number(obj_plate); i++) {
		var _plate = instance_find(obj_plate, i);
		// 0 -> unpressed plate
		// 1 -> depressed plate
		if _plate.image_index == 0 {
			image_index = 1;
			break;	
		}
	}
}









