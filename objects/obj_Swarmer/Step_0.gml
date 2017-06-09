/// @description Enemy logic

// Some ai Stuff
if (state = "idle") {
	
	sprite_index = spr_ExplodingEnemy;
	
	if (instance_exists(eater)) {
		state = "eaten";
	} else if (scr_iHaveLineOfSightTo(obj_Player)) {
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

	if (instance_exists(eater)) {
		// Move with the enemy that ate us
		x = eater.x;
		y = eater.y;
	} else {
		// Our eater has been destroyed
		scr_explodeIntoANumberOfChunks(25, obj_ExplodingEnemyChunk);
	}
}


// Facing
image_angle = direction;


// Stay inside the room
scr_stayInsideRoom();


// Collisions with solids
scr_enemyCollisionWithSolids();


// Damage
incomingProjectile = instance_place(x,y, obj_Projectile);

if (instance_exists(incomingProjectile)) {
	scr_screenShake(25);
	mySplat = instance_create_layer(x,y, "Instances", obj_SwarmerSplat);
	mySplat.image_angle = incomingProjectile.image_angle;
	scr_projectileHitSomething(incomingProjectile);
	audio_play_sound(snd_explode,1,false);
	scr_explodeIntoANumberOfChunks(15, obj_SwarmerChunk);	
}

