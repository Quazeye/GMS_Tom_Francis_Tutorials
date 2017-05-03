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


// If we've hit a block
if (place_meeting(x + hspeed, y + vspeed, obj_Solid)) {
	
	// Stop
	speed = 0;

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