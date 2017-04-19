// Quit key
if (keyboard_check_pressed(vk_escape)) {
	game_end();
}

// Restart key
if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}