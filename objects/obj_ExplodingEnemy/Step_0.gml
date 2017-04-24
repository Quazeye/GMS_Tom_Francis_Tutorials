/// @description Enemy logic

// Facing
image_angle = direction;

// Bouncing
scr_bounceOffWalls();

// Damage
incomingBullet = instance_place(x,y, obj_Projectile);


if (instance_exists(incomingBullet)) {

	// Destroy the bullet
	with (incomingBullet) {
		instance_destroy();
	}
	
	scr_explodeIntoANumberOfChunks(25, obj_ExplodingEnemyChunk);
}
