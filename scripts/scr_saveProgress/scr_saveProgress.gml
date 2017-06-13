// Create the save file.
saveFile = file_text_open_write("Progress.txt");

// Write a line of text to it.
file_text_write_string(saveFile,"Room:");
file_text_writeln(saveFile);
file_text_write_string(saveFile,string(room));
file_text_writeln(saveFile);

file_text_close(saveFile);
