// if outside the room destroy self
if (x < 0) ||(y < 0) || (x > room_width) || (y > room_height){
	instance_destroy();
}

deceleration = 400 / (room_speed * room_speed);
if (speed > deceleration) {

	speed = speed - deceleration;

} else {

	speed = 0;

}

enemyHit = instance_place(x,y, obj_Enemy);

if instance_exists(enemyHit) {

	enemyHit.x = enemyHit.x + lengthdir_x(speed, direction);
	enemyHit.y = enemyHit.y + lengthdir_y(speed, direction);	

}


// Explode when hit
if (exploding = true) {
	secondsUntilWeExplode = secondsUntilWeExplode - 1/room_speed;
	if(secondsUntilWeExplode < 0) {
		// Creates explosion			
		instance_create_depth(x,y, 1, obj_Explosion);
		instance_destroy();
	}
} else {
	projectileHit = instance_place(x,y, obj_Projectile);
	if (instance_exists(projectileHit)) {
		exploding = true;
	}
}