/// @description Enemy logic

// Facing
image_angle = direction;

// Bouncing
scr_bounceOffWalls();

// Damage

if (scr_hitByProjectile()) {

	scr_explodeIntoANumberOfChunks(25, obj_ExplodingEnemyChunk);	

}
