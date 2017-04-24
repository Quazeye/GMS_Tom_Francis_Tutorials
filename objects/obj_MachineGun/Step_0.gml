if (instance_exists(owner)) {
	x = owner.x;
	y = owner.y;
	image_angle = owner.image_angle;


	// Firing
	if(mouse_check_button(mb_left)) {
		myBullet = instance_create_depth(x,y,1,obj_Bullet);
	
		myBullet.direction = image_angle;
		myBullet.image_angle = image_angle;
		myBullet.speed = 600 / room_speed;
	
		// Kick back
		kick = 300 / room_speed;
		kickDirection = image_angle + 180;
		owner.x = owner.x + lengthdir_x(kick, kickDirection);
		owner.y = owner.y + lengthdir_y(kick, kickDirection);
	
		audio_play_sound(snd_Bullet,1,false);
	
	}
} else {
	instance_destroy();
}