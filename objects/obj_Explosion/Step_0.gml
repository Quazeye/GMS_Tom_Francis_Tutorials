image_alpha = SecondsUntilWeFadeOut / explosionLifeTime;


SecondsUntilWeFadeOut = SecondsUntilWeFadeOut - 1/room_speed;
if (SecondsUntilWeFadeOut < 0) {

	instance_destroy();

}