buttonText = argument0;
result = false;

// Find the corners of our box.
boxTop = currentY;
boxBottom = boxTop + margin + string_height(buttonText) + margin;
halfTextWidth = string_width(buttonText) / 2;
boxLeft = x - halfTextWidth - margin;
boxRight = x + halfTextWidth + margin;

draw_set_color(make_color_hsv(0, 200, 128));

// See if the cursor is hovering over it.
if (mouse_x > boxLeft && mouse_x < boxRight &&
	mouse_y > boxTop && mouse_y < boxBottom) 
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

scr_drawTextAndUpdateCurrentY(buttonText);

currentY = (currentY + (margin * 3));

return result;