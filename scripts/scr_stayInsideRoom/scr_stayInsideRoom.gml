
// Bounce off edge of room
if (y < 0 ) {
	vspeed = abs(vspeed);
}
if (y > room_height) {
	vspeed = -abs(vspeed); 
}
if (x < 0 ) {
	hspeed = abs(hspeed);
}
if (x > room_width) {
	hspeed = -abs(hspeed); 
}
