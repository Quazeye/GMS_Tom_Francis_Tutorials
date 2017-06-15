x = 20;
y = 20;
currentY = y;
margin = 10;
draw_set_halign(fa_left);
draw_set_font(fnt_Menu);

if (stage = "Controls") {
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
	if (wPressed && sPressed && dPressed && aPressed && leftClicked) {
		stage = "Swarmers";
		instance_create_layer(random(room_width),0, "Instances", obj_Swarmer);
	}
}

if (stage = "Swarmers") {
	scr_drawTextAndUpdateCurrentY("Shoot all the horrible red things");
	
	if (instance_number(obj_Swarmer) < 1) {
		stage = "Boomers";
		tutorialBoomer = instance_create_layer(random(room_width),0, "Instances", obj_Boomer);
	}
}

if (stage = "Boomers") {
	scr_drawTextAndUpdateCurrentY("The hideous green things are invincible.");
	scr_drawTextAndUpdateCurrentY("Unless they eat a red thing.");
	
	if (instance_exists(tutorialBoomer)) {
		if (tutorialBoomer.thingsEaten = 0) {
			scr_drawTextAndUpdateCurrentY("Fire some bait at a red thing.");
		} else {
			currentY = currentY + 50;
			scr_drawTextAndUpdateCurrentY("Shoot the green thing.");
		}
	} else {
		// We're done.  Show the victory screen!
		obj_Menu.mode = "Victory";
	}
	
	currentY = currentY + 50;
	
	if (rightClicked = false) {
		scr_drawTextAndUpdateCurrentY("Right click: fire bait");
		if (mouse_check_button(mb_right)) {
			rightClicked = true;
		}
	}
	
	if (instance_number(obj_Swarmer) < 1) {
		instance_create_layer(random(room_width),0, "Instances", obj_Swarmer);	
	}
}