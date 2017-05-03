
// Bounce off edge of room
if (y < 0 || y > room_height) {
	vspeed = vspeed * -1
}
if (x < 0 || x > room_width) {
	hspeed = hspeed * -1
}


// Bounce off solid objects
collisionChecks = 0;
while (place_meeting(x + hspeed, y + vspeed, obj_Solid) && collisionChecks <= 4 ) {

	direction = direction + 45;
	collisionChecks = collisionChecks + 1;

}
