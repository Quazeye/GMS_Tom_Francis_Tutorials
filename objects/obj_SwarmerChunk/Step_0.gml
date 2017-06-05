// Tom corrected these values from what he had at first becasue we measure acceleration/deceleration
// in speed lost per second, so room_speed factors into it twice.

// deceleration is for when we are blowing up
deceleration = 2000 / (room_speed * room_speed);


// We are still flying out from the initial explosion	
if (speed > deceleration) { // If there is still some speed to lose
	// Face the direction we are going
	image_angle = direction;
	// Reduce our speed by deceleration
	speed = speed - deceleration;
		
} else { // Our speed is so low that subtracting acceleration would make it zero or negative.
	
	// Stop completely
	speed = 0;

}

//Shrink over time
image_xscale = image_xscale - (1.5 / room_speed); // Less than 1 second to shrink to nothing
image_yscale = image_xscale;

//Destroy when vanished
if (image_xscale <= 0) {
	instance_destroy();
}