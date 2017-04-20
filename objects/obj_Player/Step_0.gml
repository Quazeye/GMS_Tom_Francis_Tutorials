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

// Firing
if(mouse_check_button(mb_left)) {
	myBullet = instance_create_depth(x,y,1,obj_Bullet);
	
	myBullet.direction = image_angle;
	myBullet.image_angle = image_angle;
	myBullet.speed = 600 / room_speed;
	
	// Kick back
	kick = 300 / room_speed;
	kickDirection = image_angle + 180;
	x = x + lengthdir_x(kick, kickDirection);
	y = y + lengthdir_y(kick, kickDirection);
	
	audio_play_sound(snd_Bullet,1,false);
	
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