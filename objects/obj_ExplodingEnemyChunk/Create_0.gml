// Send us flying out at a random speed and direction
speed = random_range(750, 1500) / room_speed;
direction = random(360);
/*This is from a guy in the comments.  Try instead of direction = random(360);
direction = random_range(point_direction(obj_Enemy.x,obj_Enemy.y,x,y)-80, 
						 point_direction(obj_Enemy.x,obj_Enemy.y,x,y)+80);
*/
