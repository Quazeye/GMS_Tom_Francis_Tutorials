/// @description Enemy logic

// Some ai Stuff



// Facing
image_angle = direction;

// Collisions
scr_stayInsideRoom();
scr_enemyCollisionWithSolids();


// Damage

if (scr_hitByProjectile()) {
	
	scr_screenShake(25);
	audio_play_sound(snd_explode,1,false);
	scr_explodeIntoANumberOfChunks(25, obj_ExplodingEnemyChunk);	

}
