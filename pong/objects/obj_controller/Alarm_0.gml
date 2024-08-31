/// @description New ball

instance_destroy(obj_ball)

if(global.p1_wins == false and global.p2_wins == false){
	instance_create_depth(ball_spawn_x, ball_spawn_y, 0, obj_ball)
}