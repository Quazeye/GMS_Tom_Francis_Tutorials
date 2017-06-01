// if outside the room destroy self
if (x < 0) ||(y < 0) || (x > room_width) || (y > room_height){
	instance_destroy();
}

// If we are about to hit a block
if (place_meeting(x + hspeed, y + vspeed, obj_Solid)) {
	
	// Stop
	speed = 0;

}

deceleration = 400 / (room_speed * room_speed);
if (speed > deceleration) {

	speed = speed - deceleration;

} else {

	speed = 0;

}


// If we're stuck to someone
if (instance_exists(host)) {
	// Follow the guy stuck to.
	x = host.x;
	y = host.y;
	
// If we haven't stuck to anyone yet
} else {
	
	// Did we hit anyone at all?
	enemyHit = instance_place(x,y, obj_Enemy);
	if (instance_exists(enemyHit)) {
		// If so, was it the type we can stick to?
		if (enemyHit.object_index == obj_Swarmer) {
			// If so, make that enemy our new host
			host = enemyHit;
			enemyHit.xShunt = lengthdir_x(speed, direction);
			enemyHit.yShunt = lengthdir_y(speed, direction);
		}
	}
}


// Explode when hit
if (exploding = true) {
	secondsUntilWeExplode = secondsUntilWeExplode - 1/room_speed;
	if(secondsUntilWeExplode < 0) {
		// Creates explosion			
		instance_create_depth(x,y, 1, obj_Explosion);
		instance_destroy();
	}
} else {
	projectileHit = instance_place(x,y, obj_Projectile);
	if (instance_exists(projectileHit)) {
		exploding = true;
	}
}

// We have to check if we exist in case something above has already destroyed us
if (instance_exists(self.id)) {
	if (speed = 0) {

		SecondsUntilWeFadeOut = SecondsUntilWeFadeOut - 1/room_speed;
		image_alpha = SecondsUntilWeFadeOut / puddleLifeTime;
		image_xscale = 1 + (1 - image_alpha);
		image_yscale = image_xscale;
		if(image_alpha <= 0) {
			instance_destroy();
		}
	
	}
}