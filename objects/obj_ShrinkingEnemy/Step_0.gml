/// @description Enemy logic

// Facing
image_angle = direction;

// Collisions
scr_stayInsideRoom();
scr_enemyCollisionWithSolids();

// Damage


if (scr_hitByProjectile()) {

	// Shrink ourselves
	image_xscale = image_xscale - 0.2;
	image_yscale = image_xscale;

	// Destroy ourself if we shrunk into nothing.
	// If we don't do this then we get bigger and bigger in the 
	// negative scale.
	if (image_xscale <= 0) {
		
		audio_play_sound(snd_explode,1,false);
		instance_destroy();
	}
}
