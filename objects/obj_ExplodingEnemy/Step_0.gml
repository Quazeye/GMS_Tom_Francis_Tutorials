/// @description Enemy logic

// Some ai Stuff
if (state = "idle") {
	
	sprite_index = spr_ExplodingEnemy;
	
	if (scr_iHaveLineOfSightTo(obj_Player)) {
		state = "alert";
	}
	
} else if (state = "alert") {

	sprite_index = spr_ExplodingEnemyAlert;

	// Seek the player
	if (scr_iHaveLineOfSightTo(obj_Player)) {
		// Go towards him
		direction = point_direction(x,y, obj_Player.x,obj_Player.y);
	} else {
		state = "idle";
	}
	
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
	scr_explodeIntoANumberOfChunks(25, obj_ExplodingEnemyChunk);	

}
