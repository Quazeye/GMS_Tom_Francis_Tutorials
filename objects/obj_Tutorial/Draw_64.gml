x = 20;
y = 20;
currentY = y;
margin = 10;
draw_set_halign(fa_left);
draw_set_font(fnt_Menu);


if (wPressed = false) {
	scr_drawTextAndUpdateCurrentY("W: move up");
	if (keyboard_check(ord("W"))) {
		wPressed = true;
	}
}
if (sPressed = false) {
	scr_drawTextAndUpdateCurrentY("S: move down");
	if (keyboard_check(ord("S"))) {
		sPressed = true;
	}
}
if (dPressed = false) {
	scr_drawTextAndUpdateCurrentY("D: move right");
	if (keyboard_check(ord("D"))) {
		dPressed = true;
	}
}
if (aPressed = false) {
	scr_drawTextAndUpdateCurrentY("A: move left");
	if (keyboard_check(ord("A"))) {
		aPressed = true;
	}
}
if (leftClicked = false) {
	scr_drawTextAndUpdateCurrentY("Left click: shoot");
	if (mouse_check_button(mb_left)) {
		leftClicked = true;
	}
}
