scr_initializeRoom();

// Create the player
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_Player);

instance_create_layer(0,0, "Instances", obj_Tutorial);