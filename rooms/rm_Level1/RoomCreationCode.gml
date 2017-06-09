scr_initializeRoom();

// Create the player
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Player);

// Create the game object if it doesn't already exist (to avoid have more than one when the next level generates)
if (instance_exists(obj_Game) == false) {
	instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Game);
}

safetyMargin = 128;  // so blocks don't spawn partially outside of room.


// Create some random number of blocks and if it spawns on the player destoy it.  
numberOfBlocks = irandom_range(3,10);
// Number of attempts to make before giving up (in case we have huge blocks and it can't get to the random number etc.
numberOfAttempts = numberOfBlocks * 100;
// Initial attempt
attempt = 0;

while (instance_number(obj_Solid) < numberOfBlocks && attempt < numberOfAttempts) {
	newBlock = instance_create_layer(random_range(safetyMargin,room_width - safetyMargin), random_range(safetyMargin, room_height - safetyMargin), "Instances" ,obj_Solid);
	with (newBlock) {
		// If we are on top of the player destroy us.
		if place_meeting(x,y, obj_Player) {
			instance_destroy();
		} 
	}
	attempt = attempt + 1;
}



// Create some random number of Boomers and if it spawns on the player destoy it.  
numberOfBoomers = irandom_range(3,7);
// Number of attempts to make before giving up (in case we have a situation where it can't get to the random number etc.
numberOfAttempts = numberOfBoomers * 100;
// Initial attempt
attempt = 0;

while (instance_number(obj_Boomer) < numberOfBoomers && attempt < numberOfAttempts) {
	newBoomer = instance_create_layer(random(room_width), random(room_height), "Instances" ,obj_Boomer);
	with (newBoomer) {
		// If we are on top of the player destroy us.
		if place_meeting(x,y, obj_Player) {
			instance_destroy();
		}
		if place_meeting(x,y, obj_Solid) {
			instance_destroy();
		}  
	}
	attempt = attempt + 1;
}

