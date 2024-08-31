/// @description Move to occupier

if(!empty and occupying_piece == noone){
	occupying_piece = instance_nearest(x, y, obj_piece_parent)
}

if(occupying_piece != noone){
	x = occupying_piece.x
	y = occupying_piece.y
}

if(empty){
	image_index = 0
}
else{
	image_index = 1
}