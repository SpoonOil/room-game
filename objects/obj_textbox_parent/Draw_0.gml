/// @description Insert description here
// You can write your code in this editor
accept_key = keyboard_check_pressed(ord("Z"));

//textbox_x = camera_get_view_x(view_camera[0]);
//textbox_y = camera_get_view_x(view_camera[0]);

textbox_x = 0;
textbox_y = 0;

// Initial setup
if !setup {
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	page_number = array_length(text);	
	
	for(var p = 0; p < page_number; p++) {
		
		text_length[p] = string_length(text[p]);
		text_x_offset[p] = 0;
		text_y_offset[p] = 112;
	}
}

// Typewriter effect
if draw_char < text_length[page] {
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_length[page]); 
}

// Flip through pages
if accept_key {
	// Has all the text for the current page displayed yet?
	if draw_char < text_length[page] {
		// No. This skips the typing effect and writes out all the text immediately
		draw_char = text_length[page];
	}
	else {
		// Yes. Go to the next page of text if it exists, or else destroy the textbox.
		if page < page_number - 1 {
			page++;
			draw_char = 0;
		} else {
			// We have scrolled through all the text the textbox has to offer
			instance_destroy();
		}
	}
}

// Drawing the text
txtbox_img = 0;
txtbox_spr_w = sprite_get_width(txtbox_spr);
txtbox_spr_h = sprite_get_height(txtbox_spr);

// Draw back of the textbox
draw_sprite_ext(txtbox_spr, txtbox_img, textbox_x + text_x_offset[page], textbox_y + text_y_offset[page], textbox_width/txtbox_spr_w, textbox_height/txtbox_spr_h, 0, c_white, 255);

// Draw the text on the textbox
var _drawtext = string_copy(text[page], 1, draw_char);
draw_set_color(make_color_rgb(248,255,218));
draw_text_ext(textbox_x + text_x_offset[page] + 5, textbox_y + text_y_offset[page] + 5.5, _drawtext, line_sep, line_width);