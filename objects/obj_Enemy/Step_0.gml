/// @description 

// Facing
image_angle = direction;

// Bouncing
if (y < 0 || y > room_height) {
	vspeed = vspeed * -1
}
if (x < 0 || x > room_width) {
	hspeed = hspeed * -1
}

// Damage
incomingBullet = instance_place(x,y, obj_Bullet);

if (instance_exists(incomingBullet)) {
	instance_destroy();
}
