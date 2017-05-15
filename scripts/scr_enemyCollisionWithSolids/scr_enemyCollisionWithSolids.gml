speed = normalSpeed;


// If we are about to walk into a wall, change direction until we are not.
collisionChecks = 0;
while (place_meeting(x + hspeed, y + vspeed, obj_Solid) && collisionChecks <= 4 ) {

	direction = direction + 45;
	collisionChecks = collisionChecks + 1;

}

// if we are about to be shunted into a wall, don't get shunted at all.
if (place_meeting(x + hspeed + xShunt, y + vspeed + yShunt, obj_Solid)) {
	scr_resetShunts();
}

hspeed = hspeed + xShunt;
vspeed = vspeed + yShunt;

scr_resetShunts();