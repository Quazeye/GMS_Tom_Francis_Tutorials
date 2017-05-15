
x = view_wport[0] / 2;
y = view_hport[0] / 2;

currentY = y;

draw_set_halign(fa_center);

draw_set_font(fnt_Title);
draw_text(x,currentY, "NOXP");

currentY = currentY + string_height("NOXP");

draw_set_font(fnt_Menu);
draw_text(x,currentY, "A game made for a tutorial");