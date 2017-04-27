

// Pick up weapons

if (instance_exists(owner) = false) {

	if (instance_exists(instance_place(x,y, obj_Player))) {
		owner = obj_Player;
		owner.currentWeapon = self.id;

	}
}