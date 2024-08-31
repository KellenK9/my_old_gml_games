/// @description Initialize

canoe_width = sprite_width / 2

paddle_frames = 8 //number of frames paddle has in animation (with the last frame being just the handle)

//create paddles
right_paddle = instance_create_depth(x + canoe_width, y, -900, obj_paddle)
left_paddle = instance_create_depth(x - canoe_width, y, -900, obj_paddle)

deadzone = 0.3

canoe_speed = 5

x_speed = 0
y_speed = 0

max_rotation_velocity = 10
rotation_velocity = 0
r_acceleration = 0.01
r_deceleration = 0.98

max_speed = 2
acceleration = 0.1
deceleration = 0.98

prev_angle = 0
prev_angle_r = 0
prev_distance = 0
prev_distance_r = 0