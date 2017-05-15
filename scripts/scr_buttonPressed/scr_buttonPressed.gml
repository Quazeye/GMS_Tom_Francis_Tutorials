buttonText = argument0;

boxTop = currentY;
boxBottom = boxTop + margin + string_height(buttonText) + margin;
halfTextWidth = string_width(buttonText) / 2;
boxLeft = x - halfTextWidth - margin;
boxRight = x + halfTextWidth + margin;

draw_set_color(make_color_hsv(0, 200, 128));

draw_rectangle(boxLeft, boxTop, boxRight, boxBottom, false);

draw_set_color(c_white);

currentY = currentY + margin;

scr_drawTextAndUpdateCurrentY(buttonText);