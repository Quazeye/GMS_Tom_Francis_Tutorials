if (file_exists("Inventory.txt")) {
	
	// Open the save file for reading.
	saveFile = file_text_open_read("Inventory.txt");

	// Write a line of text to it.
	//file_text_write_string(saveFile,"Inventory:");

	// skip the first line that just has the word Inventory: as above (commented out for the load).
	file_text_readln(saveFile);

	// Write a list of our weapons.
	i = 0;

	// While we haven't reached the end of the file.
	while(file_text_eof(saveFile)== false) {
	
		// Read in weapons.
		weaponType = file_text_read_real(saveFile);
		// Create the weapon that will then be picked up by the player as it is created on the player.
		instance_create_layer(x,y, "Instances", weaponType);
		// Move to the next line.
		file_text_readln(saveFile);

		i = i + 1;
	}

	file_text_close(saveFile);

}