//image_alpha = SecondsUntilWeFadeOut / explosionLifeTime;
//SecondsUntilWeFadeOut = SecondsUntilWeFadeOut - 1/room_speed;

// If our animation is over
if (image_index + image_speed > image_number - 1) {

	instance_destroy();

}