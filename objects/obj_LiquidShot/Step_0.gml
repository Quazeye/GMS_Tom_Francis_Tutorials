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