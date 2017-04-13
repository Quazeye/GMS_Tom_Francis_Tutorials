/// @description Player Movement

// Movement
mySpeed = 5;

if (keyboard_check(ord("W"))) {
	y = y - mySpeed;
}
if (keyboard_check(ord("S"))) {
	y = y + mySpeed;
}
if (keyboard_check(ord("A"))) {
	x = x - mySpeed;
}
if (keyboard_check(ord("D"))) {
	x = x + mySpeed;
}

// Facing
image_angle = point_direction(x,y, mouse_x,mouse_y);

// Firing
if(mouse_check_button(mb_left)) {
	myBullet = instance_create_depth(x,y,1,obj_Bullet);
	
	myBullet.direction = image_angle;
	myBullet.image_angle = image_angle;
	myBullet.speed = 10;
}


