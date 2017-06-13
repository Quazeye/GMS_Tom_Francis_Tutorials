// Create the player
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Player);

// Create the game object if it doesn't already exist (to avoid have more than one when the next level generates)
if (instance_exists(obj_Game) == false) {
	instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Game);
}
