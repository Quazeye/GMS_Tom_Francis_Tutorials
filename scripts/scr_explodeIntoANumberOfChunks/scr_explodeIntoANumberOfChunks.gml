numberOfBitsToCreate = argument0;
typeOfChunk = argument1;

bitsCreatedSoFar = 0;

// Create a number of bits.  This loops until enough bits have been created	
while (bitsCreatedSoFar < numberOfBitsToCreate) {
	// Create a bit
	instance_create_depth(x,y, 1, typeOfChunk); 
	// Count it as created
	bitsCreatedSoFar = bitsCreatedSoFar + 1;
}
	
// Play an explody sound
audio_play_sound(snd_playerDeath,1,false);

// Destroy the player
instance_destroy();