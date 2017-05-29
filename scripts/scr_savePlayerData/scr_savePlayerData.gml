// Create the save file.
saveFile = file_text_open_write("PlayerData.txt");

// Write a line of text to it.
file_text_write_string(saveFile,"Inventory:");
file_text_writeln(saveFile);

// Write a list of our weapons.
i = 0;
while(i < weaponCount) {
	
	//Record that we have this weapon.
	file_text_write_real(saveFile,weapon[i].object_index);
	file_text_writeln(saveFile);
	i = i + 1;
}

file_text_close(saveFile);

