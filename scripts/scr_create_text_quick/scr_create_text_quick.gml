// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_text_quick(_text){
	// This script, when triggered, creates a "quick" textbox with the specified text
	textbox = instance_create_depth(0,0,-16000, obj_textbox_quick, {text : _text});
}