thing = argument0;
result = false;

if (instance_exists(thing)) {
	if (collision_line(x,y, thing.x,thing.y, obj_Solid, true, true) = noone) {
		result = true;
	}
}

return result;