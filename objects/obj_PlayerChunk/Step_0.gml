// Tom corrected these values from what he had at first becasue we measure acceleration/deceleration
// in speed lost per second, so room_speed factors into it twice.

// deceleration is for when we are blowing up
deceleration = 1500 / (room_speed * room_speed);
// acceleration is for when we're sucking back in 
acceleration = 300 / (room_speed * room_speed);

if (reassembling = false) {  // We are still flying out from initial explosion
	
	
	if (speed > deceleration) { // If there is still some speed to lose
		// Face the direction we are going
		image_angle = direction;
		// Reduce our speed by deceleration
		speed = speed - deceleration;
		
	} else { // Our speed is so low that subtracting acceleration would make it zero or negative.
	
		// Stop completely
		speed = 0;
		// Get ready to head in the opposite direction
		direction = direction + 180;
		// Enter reassembling phase
		reassembling = true;

	}

	
} else {  // We've stopped flying out and now want to be sucked back in

	// Increase our speed.. we set up our direction above in the else
	speed = speed + acceleration;
	
	// If our distance to our birthplace is so small that we are about to reach or go past it
	if (point_distance(x,y, originalX, originalY) < speed) {
	
		// We've reached close enough to our original position so stop
		speed = 0;

		// Did we only just arrive?
		if (inPosition = false) {
		
			// Yes, we weren't inPosition before, so count us as having arrived
			obj_Game.bitsReassembled = obj_Game.bitsReassembled + 1;
			// Remember that we are here and have already been counted
			inPosition = true;
			audio_play_sound(snd_ChunkArrive,1,false);
		}
		
		// Have all of the pieces returned yet?
		if (obj_Game.bitsReassembled >= obj_Game.numberOfBitsThePlayerIsMadeOf) {
			
			// Yes! The number of bits that have returned to position is the number of bits that came out of us
			
			// Re-create the player
			instance_create_depth(x,y, 1, obj_Player);
			audio_play_sound(snd_Reassemble ,1,false);
			// Destroy all the chunks
			with (obj_PlayerChunk) {
				instance_destroy();
			}
			// Reset the 'bits reassembled' count
			obj_Game.bitsReassembled = 0;	
		}
	}
}

