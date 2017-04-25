if (instance_exists(owner)) {
	x = owner.x;
	y = owner.y;
	image_angle = owner.image_angle;

	// Firing
	
	// Increment timer
	secondsSinceLastShot = secondsSinceLastShot + 1 / room_speed;

	// If we're clicking and we're ready to fire
	if(mouse_check_button(mb_left) && secondsSinceLastShot >= secondsBetweenShots) {
	
		secondsSinceLastShot = 0;
	
		myBullet = instance_create_depth(x,y,1,obj_Bullet);
	
		myBullet.direction = image_angle;
		myBullet.image_angle = image_angle;
		myBullet.speed = 1000 / room_speed;
	
		// Kick back
		kick = 1000 / room_speed;
		kickDirection = image_angle + 180;
		owner.x = owner.x + lengthdir_x(kick, kickDirection);
		owner.y = owner.y + lengthdir_y(kick, kickDirection);
	
		audio_play_sound(snd_Bullet,1,false);
	
	}
}