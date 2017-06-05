/// @description Enemy logic

//Eat Globs
detectionRange = 400;
eatRange = 10;

nearestGlob = instance_nearest(x,y, obj_Glob);

// Is there a glob
if (instance_exists(nearestGlob)) {

	// Is it near enought that I can smell it?
	distanceToGlob = point_distance(x,y, nearestGlob.x,nearestGlob.y);
	if (distanceToGlob < detectionRange) {
		// Okay, but can I get there?
		if (scr_iHaveLineOfSightTo(nearestGlob)) {
			// Yes to all, Seek the glob!
			direction = point_direction(x,y, nearestGlob.x,nearestGlob.y);
			if (distanceToGlob < eatRange) {
				with (nearestGlob) {
					instance_destroy();
				}
				growthRate = 0.1;
				maximumSize = 2;
				if (image_xscale < maximumSize) {
					image_xscale = image_xscale + growthRate;
					image_yscale = image_yscale + growthRate;
					if (place_meeting(x,y, obj_Solid)) {  //trying to avoid getting stuck in solids
						image_xscale = image_xscale - growthRate;
						image_yscale = image_yscale - growthRate;
					}
				}
				
			}
		}
	}
} 

// Facing
image_angle = direction;

// Collisions
scr_stayInsideRoom();
scr_enemyCollisionWithSolids();

// Damage


if (scr_hitByProjectile()) {
	// If we have a swarmer inside us, explode.
}
