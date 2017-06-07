if (instance_exists(owner)) {
	x = owner.x;
	y = owner.y;
	image_angle = owner.facing;

				
	// Firing
	if(mouse_check_button_pressed(mb_right)) {
		myBullet = instance_create_depth(x,y,1,obj_Glob);
	
		myBullet.direction = image_angle + random_range(-1, 1);
		myBullet.speed = random_range(500, 700) / room_speed;
		myBullet.image_angle = myBullet.direction;

				
		audio_play_sound(snd_Bullet,1,false);
	
	}
}

scr_canBePickedUp();