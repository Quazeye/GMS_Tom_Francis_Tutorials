thisProjectile = argument0;

if (thisProjectile.object_index != obj_PlayerChunk) {
	with (thisProjectile) {
		instance_destroy();
	}
}