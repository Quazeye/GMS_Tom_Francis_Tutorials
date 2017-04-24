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


// Facing
image_angle = point_direction(x,y, mouse_x,mouse_y);


// Pick up weapons
weaponTouching = instance_place(x,y, obj_MachineGun);

if (instance_exists(weaponTouching)) {

	currentWeapon = weaponTouching;
	currentWeapon.owner = self.id;

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

	scr_explodeIntoANumberOfChunks(obj_Game.numberOfBitsThePlayerIsMadeOf, obj_PlayerChunk);
	
}