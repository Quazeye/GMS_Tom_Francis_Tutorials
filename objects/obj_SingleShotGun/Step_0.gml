if (instance_exists(owner)) {
	x = owner.x;
	y = owner.y;
	image_angle = owner.facing;
	secondsBetweenShots = 5 / owner.powerUp;

	if (owner.weapon[owner.selectedWeaponIndex] = self.id) {

		// Firing //
	
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
			owner.xShunt = lengthdir_x(kick, kickDirection);
			owner.yShunt = lengthdir_y(kick, kickDirection);
			
			scr_screenShake(15);
	
			audio_play_sound(snd_Bullet,1,false);
	
		}
	}
}

scr_canBePickedUp();