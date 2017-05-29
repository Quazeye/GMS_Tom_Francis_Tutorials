// Draw our sprite normally but facing our "facing" direction, without changing image_angle, so as not to affect collision.
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction,
				image_blend, image_alpha);

draw_sprite_ext(spr_Player, image_index, x, y, image_xscale, image_yscale, facing,
				image_blend, image_alpha);