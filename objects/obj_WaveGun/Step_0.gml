if (instance_exists(owner)) {
	x = owner.x;
	y = owner.y;
	image_angle = owner.facing;

	if (owner.weapon[owner.selectedWeaponIndex] = self.id) {
	
			
		// Firing
		if(mouse_check_button(mb_left)) {
			myBullet = instance_create_depth(x,y,1,obj_Glob);
	
			myBullet.direction = image_angle + random_range(-5, 5);
			myBullet.speed = random_range(500, 700) / room_speed;
			myBullet.image_angle = myBullet.direction;

				
			audio_play_sound(snd_Bullet,1,false);
	
		}
	}
}

scr_canBePickedUp();