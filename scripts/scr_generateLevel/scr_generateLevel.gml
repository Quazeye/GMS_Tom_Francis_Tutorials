// Create the player
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Player);

// Create the game object if it doesn't already exist (to avoid have more than one when the next level generates)
if (instance_exists(obj_Game) == false) {
	instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Game);
}

blockSize = 128;
safetyMargin = blockSize;  // so blocks don't spawn partially outside of room.
blockColor = make_color_rgb(random(255), random(255), random(255));

// Create some random number of blocks and if it spawns on the player destoy it.  
numberOfBlocks = irandom_range(3,10);
// Number of attempts to make before giving up (in case we have huge blocks and it can't get to the random number etc.
numberOfAttempts = numberOfBlocks * 100;
// Initial attempt
attempt = 0;

while (instance_number(obj_Solid) < numberOfBlocks && attempt < numberOfAttempts) {
	newBlock = instance_create_layer(random_range(safetyMargin,room_width - safetyMargin), random_range(safetyMargin, room_height - safetyMargin), "Instances" ,obj_Solid);
	newBlock.x = (newBlock.x div blockSize) * blockSize; // x div blocksize divides x by blocksize and drops remainder.  So this will for the blocksize 128 always be a multiple of 128.
	newBlock.y = (newBlock.y div blockSize) * blockSize; // See above!
	newBlock.image_blend = blockColor;
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


// Create a number of tints.  
numberOfTints = 30;
// Create some random colors
color1 = make_color_rgb(random(255), random(255), random(255));
color2 = make_color_rgb(random(255), random(255), random(255));

while (instance_number(obj_Tint) < numberOfTints) {
	newTint = instance_create_layer(random(room_width), random(room_height), "Instances" ,obj_Tint);
	newTint.image_blend = choose(color1, color2);
}
