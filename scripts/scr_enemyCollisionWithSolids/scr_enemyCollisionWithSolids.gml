speed = normalSpeed;


// If we are about to walk into a wall, change direction until we are not.
collisionChecks = 0;
directionToCheck = choose(-1,1);

while (place_meeting(x + hspeed, y + vspeed, obj_Solid) && collisionChecks <= 12 ) {

	direction = direction + (random_range(30,60) * directionToCheck);
	collisionChecks = collisionChecks + 1;

}

// if we are about to be shunted into a wall, don't get shunted at all.
if (place_meeting(x + hspeed + xShunt, y + vspeed + yShunt, obj_Solid)) {
	scr_resetShunts();
}

hspeed = hspeed + xShunt;
vspeed = vspeed + yShunt;

scr_resetShunts();