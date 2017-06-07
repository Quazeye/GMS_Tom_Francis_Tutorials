facing = 0;
weaponCount = 0;
selectedWeaponIndex = 0;
powerUp = 5;
powerUpMax = 15 //75;

scr_resetShunts();

// Create the weapons for player and player will auto pick up at start because of pickup code (which we don't really need anymore but will keep so we don't have to rework things)
instance_create_layer(x,y, "Instances", obj_RapidFireGun);
instance_create_layer(x,y, "Instances", obj_BaitGun);
