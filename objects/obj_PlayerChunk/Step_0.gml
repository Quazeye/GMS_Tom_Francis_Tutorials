// slow down chunks
acceleration = 300 / (room_speed * room_speed);
deceleration = 1500 / (room_speed * room_speed);

if (reassembling = false) {
	if (speed > deceleration) {
		image_angle = direction;
		speed = speed - deceleration;
	} else {
		reassembling = true;
		direction = direction + 180;
		speed = 0;
	}
} else {
	speed = speed + acceleration;
	
	if (point_distance(x,y, originalX, originalY) < speed) {
		// We've reached our original position
		speed = 0;
		if (inPosition = false) {
			obj_Game.bitsReassembled = obj_Game.bitsReassembled + 1;
			inPosition = true;
		}
		if (obj_Game.bitsReassembled >= obj_Game.numberOfBitsThePlayerIsMadeOf) {
			instance_create_depth(x,y, 1, obj_Player);
			with (obj_PlayerChunk) {
				instance_destroy();
			}
			obj_Game.bitsReassembled = 0;	
		}
	}
}

