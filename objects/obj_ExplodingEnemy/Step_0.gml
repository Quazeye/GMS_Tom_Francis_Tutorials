/// @description Enemy logic

// Facing
image_angle = direction;

// Bouncing
scr_bounceOffWalls();


// Damage

if (scr_hitByProjectile()) {
	
	audio_play_sound(snd_explode,1,false);
	scr_explodeIntoANumberOfChunks(25, obj_ExplodingEnemyChunk);	

}
