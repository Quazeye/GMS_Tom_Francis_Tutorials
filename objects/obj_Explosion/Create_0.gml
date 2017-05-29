image_speed = 10 / room_speed;

scr_screenShake(15);
audio_play_sound(snd_explode,1,false);
explosionLifeTime = 0.2;
SecondsUntilWeFadeOut = explosionLifeTime;
