

if (keyboard_check_pressed(vk_escape)) {
	if (mode != "Titles") {
		mode = "Titles";
	} else {
		mode = "Game";
	}
}

if (instance_number(obj_Enemy) < 1 && room = rm_Level1) {
	if (mode = "Game") {
		mode = "Victory";
	}
}
