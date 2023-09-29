// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update_state(_instance, _state){
	// Discard the information of the oldest state, if necessary
	if _instance.current_state >= global.max_states {
		for (var _i = 0; _i < global.max_states - 1; _i++) {
			_instance.state_array[_i] = _instance.state_array[_i+1];
		}
		_instance.current_state -= 1;
	}
	
	// Store the information of the current state
	_instance.state_array[_instance.current_state] = _state;
	
	if _instance.current_state < global.max_states {
		_instance.current_state += 1;	
	}
}

function scr_revert_state(_instance) {
	state = _instance.state_array[array_length(_instance.state_array) - 1];
	array_delete(_instance.state_array, -1, 1);
	_instance.current_state -= 1;
	return state;
}