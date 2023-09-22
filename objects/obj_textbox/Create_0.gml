/// @description Insert description here
// You can write your code in this editor
depth = 0;

textbox_width = 160;
textbox_height = 32;
border = 4;
line_sep = 11;
line_width = textbox_width - 2*border;

txtbox_spr = spr_textbox;
txtbox_img = 0;
txtbox_img_speed = 6/60;

// the text
page = 0;
page_number = 0;
text[0] = "May the forces of gravity show mercy";
text[1] = "on those who cross my path...";
text[2] = "Please don't be mistaken... ";
text[3] = "I am an innocent man at heart.";
text_length[0] = string_length(text[0]);
draw_char = 0;

text_speed = 1;

setup = false;






