// Look for a projectile
incomingProjectile = instance_place(x,y, obj_Projectile);

if (instance_exists(incomingProjectile)) {
	
	// If there was one, send back 'true'
	return true;
	
} else {
	
	// If there wasn't one, send back 'false'
	return false;

}