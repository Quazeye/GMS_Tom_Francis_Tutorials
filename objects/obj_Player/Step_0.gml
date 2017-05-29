/// @description Player Movement


// Movement
mySpeed = 300 / room_speed;

speed = 0;

if (keyboard_check(ord("W"))) {
	vspeed = -mySpeed;
}
if (keyboard_check(ord("S"))) {
	vspeed = mySpeed;
}
if (keyboard_check(ord("A"))) {
	hspeed = -mySpeed;
}
if (keyboard_check(ord("D"))) {
	hspeed = mySpeed;
}

image_speed = speed / 20;

hspeed = hspeed + xShunt;
vspeed = vspeed + yShunt;
scr_resetShunts();

	// For testing saving
	//if (keyboard_check(vk_down)) {
	//	scr_saveInventory();
	//}
	//if (keyboard_check(vk_up)) {
	//	scr_loadInventory();
	//}

// If we're about to hit a block
if (place_meeting(x + hspeed, y + vspeed, obj_Solid)) {
	
	// Keep as much of our horizontal speed as possible
	oldHspeed = hspeed;
	hspeed = 0;
	while (place_meeting(x + hspeed + sign(oldHspeed), y, obj_Solid) = false && // Check there's still room if we crept a bit closer to our old hspeed
		   abs(hspeed) < abs(oldHspeed)) // Check we haven't restored all of our old hspeed
	{									 // and only pay attention to the absolute value.
		// Creep toward old hspeed
		hspeed = hspeed + sign(oldHspeed); // sign will be -1 if number is negative
										   // sign will be +1 if number is positive
										   // sign will be 0 if number is 0
	}
	// We have now figured out how much of our hspeed we can keep without hitting anything, so we're keeping that.
	
	// Keep as much of our vertical speed as possible
	oldVspeed = vspeed;
	vspeed = 0;
	while (place_meeting(x + hspeed, y + vspeed + sign(oldVspeed), obj_Solid) = false && // Check there's still room if we crept a bit closer to our old vspeed
		   abs(vspeed) < abs(oldVspeed)) // Check we haven't restored all of our old vspeed
	{									 // and only pay attention to the absolute value.
		// Creep toward old vspeed
		vspeed = vspeed + sign(oldVspeed); // sign will be -1 if number is negative
										   // sign will be +1 if number is positive
										   // sign will be 0 if number is 0
	}
}


// Weapon Switching

if (mouse_check_button_pressed(mb_right)) {
	// Switch to next weapon up
	selectedWeaponIndex = selectedWeaponIndex + 1;
	// If we've gone to far, loop back
	if (selectedWeaponIndex >= weaponCount) {
	
		selectedWeaponIndex = 0;
	
	}

}


// Facing
facing = point_direction(x,y, mouse_x,mouse_y);


if (powerUp >= powerUpMax) {
	// go to the next level
	if (room_exists(room_next(room))) {
		room_goto_next();
	}
} else {
	powerUpCollected = instance_place(x,y, obj_PowerUp);
	if (instance_exists(powerUpCollected)) {
		with (powerUpCollected) {
			instance_destroy();
		}
		powerUp = powerUp + 1;
	}
}

// Stay inside the room
if (x < 0) {
	x = 0;
}
if (y < 0) {
	y = 0;
}
if (x > room_width) {
	x = room_width;
}
if (y > room_height){
	y = room_height;
}


// Death

// Look for an enemy touching us
EnemyTouchingMe = instance_place(x,y, obj_Enemy);

// If there is one
if (instance_exists(EnemyTouchingMe)) {
	
	scr_screenShake(80);
	scr_explodeIntoANumberOfChunks(obj_Game.numberOfBitsThePlayerIsMadeOf, obj_PlayerChunk);
	
}