
x = view_wport[0] / 2;
y = 0;

currentY = y;
margin = 10;

draw_set_halign(fa_center);

draw_set_font(fnt_Title);
scr_drawTextAndUpdateCurrentY("NOXP");

draw_set_font(fnt_Menu);
scr_drawTextAndUpdateCurrentY("A game made for a tutorial");

currentY = currentY + 50;
if (scr_buttonPressed("Start Game")){
	room_goto_next();
}

if (scr_buttonPressed("Quit")) {
	game_end();
}