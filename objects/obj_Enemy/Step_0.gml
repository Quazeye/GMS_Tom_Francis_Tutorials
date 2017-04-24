/// @description Enemy logic

// Facing
image_angle = direction;

// Bouncing
scr_bounceOffWalls();

// Damage


if (scr_hitByProjectile()) {

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
