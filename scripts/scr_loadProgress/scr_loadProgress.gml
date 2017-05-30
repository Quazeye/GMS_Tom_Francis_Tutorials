if (file_exists("Progress.txt")){

	saveFile = file_text_open_read("Progress.txt");


	// skip the first line that just has the word Room:
	file_text_readln(saveFile);
	roomToGoTo = file_text_read_real(saveFile);
	if (room_exists(roomToGoTo)) {
		room_goto(roomToGoTo);
	}
	
	file_text_close(saveFile);

	obj_Menu.mode = "Game";
}