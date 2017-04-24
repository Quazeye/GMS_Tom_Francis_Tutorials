// Look for a projectile
incomingProjectile = instance_place(x,y, obj_Projectile);

if (instance_exists(incomingProjectile)) {
	
	// If the projectile is NOT a player chunk
	if (incomingProjectile.object_index != obj_PlayerChunk) {
		with (incomingProjectile) {
			instance_destroy();
		}
	}
	// If there was one, send back 'true'
	return true;
	
} else {
	
	// If there wasn't one, send back 'false'
	return false;

}