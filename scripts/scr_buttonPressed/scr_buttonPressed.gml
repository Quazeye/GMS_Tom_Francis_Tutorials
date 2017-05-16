buttonText = argument0;
result = false;

// Find the corners of our box.
boxTop = currentY;
textTop = boxTop + margin;
boxBottom = boxTop + margin + string_height(buttonText) + margin;
halfTextWidth = string_width(buttonText) / 2;
boxLeft = x - halfTextWidth - (margin * 2);
boxRight = x + halfTextWidth + (margin * 2);

draw_set_color(make_color_hsv(0, 200, 128));

// See if the cursor is hovering over it.
if (device_mouse_x_to_gui(0) > boxLeft && device_mouse_x_to_gui(0) < boxRight
	&& device_mouse_y_to_gui(0) > boxTop && device_mouse_y_to_gui(0) < boxBottom) 
{
	draw_set_alpha(1);
	if (mouse_check_button_pressed(mb_left)) 
	{
		result = true;
	}
} else {
	draw_set_alpha(0.5);
}


draw_rectangle(boxLeft, boxTop, boxRight, boxBottom, false);
draw_set_alpha(1);

draw_set_color(c_white);

currentY = currentY + margin;


currentY = textTop;
scr_drawTextAndUpdateCurrentY(buttonText);

currentY = (currentY + (margin * 2));

return result;