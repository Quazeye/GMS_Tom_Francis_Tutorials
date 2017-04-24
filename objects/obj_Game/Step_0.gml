// Enemy Spawning
secondsSinceLastEnemySpawn = secondsSinceLastEnemySpawn + (1 / room_speed);

if (secondsSinceLastEnemySpawn >= secondsBetweenEnemySpawns) {

	// Spawn enemy
	if choose(true, false) {	
		spawnX = random(room_width);
		spawnY = choose(0, room_height);
	} else {
		spawnX = choose(0, room_width);
		spawnY = choose(room_height);
	}
		
	instance_create_depth(spawnX, spawnY, 1, choose(obj_ShrinkingEnemy,
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