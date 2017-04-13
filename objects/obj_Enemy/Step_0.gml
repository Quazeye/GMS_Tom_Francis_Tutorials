/// @description Enemy logic

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

	// Destroy the bullet
	with (incomingBullet) {
		instance_destroy();
	}

	// Shrink ourselves
	image_xscale = image_xscale - 0.2;
	image_yscale = image_xscale;

	// Destroy ourself if we shrunk into nothing.
	// If we don't do this then we get bigger and bigger in the 
	// negative scale.
	if (image_xscale <= 0) {
		instance_create_depth(random(room_width), random(room_height),1,obj_Enemy);
		instance_destroy();
	}
}
