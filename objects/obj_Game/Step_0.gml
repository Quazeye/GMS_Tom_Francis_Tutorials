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



// If we've been told to shake the screen by any amount
if (screenShakeAmount > 0) {
	// Make sure that amount is being reduced each frame, so we stablize eventually
	screenShakeAmount = screenShakeAmount - 3;
} else {
	// If we've stablized or never had any screen shake.
	screenShakeAmount = 0;
	// Note the position the view "should" be in.  Can make variables but just using x and y of game object as it isn't shown in game anyway.
	x = view_xport[0];   
	y = view_yport[0];
}
// View position should wobble away from normal position by screenshake amount.
// If its zero it will be stable.
view_xport[0] = x + random_range(-screenShakeAmount, screenShakeAmount);
view_yport[0] = y + random_range(-screenShakeAmount, screenShakeAmount);




// Restart key
if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}