/// @description Insert description here
// You can write your code in this editor

// Before opening the hole, make sure the player has collected all keys and that all pressure plates are in a depressed state
old_index = image_index;

image_index = 0; // We want to try to open the hole, but if a false flag comes up, we'll determine it to be closed by the end of this step code.

// Are there any keys left to collect?
for (i = 0; i < instance_number(obj_key); i++) {
	if !obj_key.collected {
		// Yes, there is a key that still needs to be collected.
		image_index = 1;
		break;
	}
}

if image_index == 0 {
	// If we got to here, then all keys have been collected. Next, let's check whether all pressure plates are depressed or not.
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

if old_index != image_index && instance_number(obj_transition_parent) == 0 {
	if image_index == 1 {
		audio_play_sound(snd_hole_closing,0,false);	
	} else {
		audio_play_sound(snd_hole_opening,0,false);
	}
}









