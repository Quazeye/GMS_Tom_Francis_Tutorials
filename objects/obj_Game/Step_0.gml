// Enemy Spawning
secondsSinceLastEnemySpawn = secondsSinceLastEnemySpawn + (1 / room_speed);

if (secondsSinceLastEnemySpawn >= secondsBetweenEnemySpawns) {

	// Spawn enemy
	instance_create_depth(random(room_width), random(room_height), 1, choose(obj_ShrinkingEnemy,
							obj_ExplodingEnemy, obj_ExplodingEnemy));
	secondsSinceLastEnemySpawn = 0;

}

// Quit key
if (keyboard_check_pressed(vk_escape)) {
	game_end();
}

// Restart key
if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}