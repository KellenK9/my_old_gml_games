/// @description Draw Scores

draw_set_font(global.Font)
draw_set_color(text_color_hex)
score_text = string(global.p1_score) + "-" + string(global.p2_score)
draw_text(ball_spawn_x - 5, 2, score_text)

if(global.p1_wins == true){
	draw_text(ball_spawn_x - 21, 10, "player 1 is")
	draw_text(ball_spawn_x - 20, 18, "victorious!")
}

if(global.p2_wins == true){
	draw_text(ball_spawn_x - 21, 10, "player 2 is")
	draw_text(ball_spawn_x - 20, 18, "victorious!")
}