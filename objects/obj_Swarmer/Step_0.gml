/// @description Enemy logic

// Some ai Stuff
if (state = "idle") {
	
	sprite_index = spr_ExplodingEnemy;
	
	if (scr_iHaveLineOfSightTo(obj_Player)) {
		// If we are looking in the player's direction
		directionToPlayer = point_direction(x,y, obj_Player.x,obj_Player.y);
		relativeDirectionToPlayer = abs(image_angle - directionToPlayer);  // The difference between the 2 angles.
		halfFieldOfView = 45;
		
		if (relativeDirectionToPlayer < halfFieldOfView 
			|| relativeDirectionToPlayer > 360 - halfFieldOfView) {
			state = "alert";
		}
	}
	
} else if (state = "alert") {

	sprite_index = spr_ExplodingEnemyAlert;
	
	if (instance_exists(eater)) {
		
		state = "eaten";
		
	} else 
	// Seek the player
	if (scr_iHaveLineOfSightTo(obj_Player)) {
		// Go towards him
		direction = point_direction(x,y, obj_Player.x,obj_Player.y);
	} else {
		state = "idle";
	}
	
} else if (state = "eaten") {

	

}


// Facing
image_angle = direction;


// Stay inside the room
scr_stayInsideRoom();


// Collisions with solids
scr_enemyCollisionWithSolids();


// Damage
if (scr_hitByProjectile()) {
	
	scr_screenShake(25);
	audio_play_sound(snd_explode,1,false);
	scr_explodeIntoANumberOfChunks(15, obj_SwarmerChunk);	

}
