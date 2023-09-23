/// @description Insert description here

// This is a variant of obj_textbox_parent which is designed to quickly display text and fade away
// after that text is displayed

depth = -16000;

textbox_width = 120;
textbox_height = 16;
border = 4;
line_sep = 11;
line_width = textbox_width - 2*border;

txtbox_spr = spr_textbox;
txtbox_img = 0;
txtbox_img_speed = 6/60;

// the text
// text[0] = "If this shows up, something is wrong.";

page = 0;
page_number = 0;
text_length[0] = string_length(text[0]);
draw_char = 0;

text_speed = 1;

setup = false;
set_alarm = false;






