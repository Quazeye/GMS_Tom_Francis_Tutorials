if (mode == "Titles") {
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
	if (scr_buttonPressed("New Game")){
		mode = "Game";
		room_goto(rm_Game);
	}

	if (scr_buttonPressed("Quit")) {
		game_end();
	}
} else if (mode == "Game") {
	if (instance_exists(obj_Player)) {
		barIndent = 50;
		barWidth = view_wport[0] - (barIndent * 2);
		barHeight = 20;
		barTop = (view_hport[0] - barIndent) - barHeight;
	
		powerFraction = obj_Player.powerUp / obj_Player.powerUpMax;
	
		draw_set_color(c_green);
		draw_set_alpha(0.7);
		draw_rectangle(barIndent, barTop, barIndent + barWidth, barTop + barHeight, true);
		draw_rectangle(barIndent, barTop, barIndent + (barWidth * powerFraction), barTop + barHeight, false);
		draw_set_alpha(1);
	}
}