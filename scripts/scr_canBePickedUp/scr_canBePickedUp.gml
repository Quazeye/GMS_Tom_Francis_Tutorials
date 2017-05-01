

// Pick up weapons

if (instance_exists(owner) = false) {

	if (instance_exists(instance_place(x,y, obj_Player))) {
		// Remember who owns us
		owner = obj_Player.id;
		
		// Add us to our new owner's weapon array
		owner.weapon[owner.weaponCount] = self.id;
		
		// Tell our owner that they have one more weapon than before
		owner.weaponCount = owner.weaponCount + 1;
	}
}