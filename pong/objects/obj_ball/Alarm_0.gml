/// @description Set Ball Speed

global.ball_x_speed = -0.2
y_speed = random_range(global.min_angle, global.max_angle)
random_boolean = random_range(0, 100)
if(random_boolean > 50){
	y_speed = -y_speed
}