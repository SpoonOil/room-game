/// @description Insert description here

//Draw the background for the text
draw_sprite_ext(sprite_index, image_index, x,y,width / sprite_width, height/ sprite_height, 0, c_white, 1);

//Draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(248,255,218));

for (var i = 0; i < op_length; i++) {
	draw_text(x + op_border + 7,y + op_border + op_space*i, option[i]);
}

draw_sprite(spr_cursor, 0, x + op_border,y + op_border + 2 + op_space*pos);








