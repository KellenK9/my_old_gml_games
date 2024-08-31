/// @description Draw GUI

//Check if game is won
white_kings = 0
black_kings = 0
for(i = 0; i < 14; i++){
	curr_piece = instance_find(obj_black_piece, i)
	if(curr_piece.taken == 0 and curr_piece.image_index == 5){
		black_kings ++
	}
	curr_piece = instance_find(obj_white_piece, i)
	if(curr_piece.taken == 0 and curr_piece.image_index == 5){
		white_kings ++
	}
}
if(white_kings == 0){
	draw_text(8, 8, "Black Wins!")
	global.game_over = true
}
if(black_kings == 0){
	draw_text(8, 8, "White Wins!")
	global.game_over = true
}