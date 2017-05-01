/// @description Player Movement


// Movement
mySpeed = 300 / room_speed;

if (keyboard_check(ord("W"))) {
	y = y - mySpeed;
}
if (keyboard_check(ord("S"))) {
	y = y + mySpeed;
}
if (keyboard_check(ord("A"))) {
	x = x - mySpeed;
}
if (keyboard_check(ord("D"))) {
	x = x + mySpeed;
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
image_angle = point_direction(x,y, mouse_x,mouse_y);



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

	scr_explodeIntoANumberOfChunks(obj_Game.numberOfBitsThePlayerIsMadeOf, obj_PlayerChunk);
	
}