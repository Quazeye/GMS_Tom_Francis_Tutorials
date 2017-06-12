// Tom corrected these values from what he had at first becasue we measure acceleration/deceleration
// in speed lost per second, so room_speed factors into it twice.

// deceleration is for when we are blowing up
deceleration = 2000 / (room_speed * room_speed);

// If we are about to hit something
if (place_meeting(x + hspeed, y + vspeed, obj_Solid)) {
	// Are we hitting something horizontally?
	if (place_meeting(x + hspeed, y, obj_Solid)) {
		// If so bounce horizontally
		hspeed = hspeed * -1;
	}
	// Are we hitting something vertically?
	if (place_meeting(x, y + vspeed, obj_Solid)) {
		// If so bounce vertically
		vspeed = vspeed * -1;
	}
}

// We are still flying out from the initial explosion	
if (speed > deceleration) { // If there is still some speed to lose
	// Face the direction we are going
	image_angle = direction;
	// Reduce our speed by deceleration
	speed = speed - deceleration;
		
} else { // Our speed is so low that subtracting acceleration would make it zero or negative.
	
	// Stop completely
	speed = 0;
	mySplat = instance_create_layer(x,y, "Instances", obj_BoomerSplat);
	mySplat.image_angle = image_angle;
	instance_destroy();
}

