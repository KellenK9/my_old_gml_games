/// Initialize variables

gravity_acceleration = 0.09
x_speed = 0
y_speed = 0
closest_node = instance_nearest(x, y, obj_node)
clockwise = false
distance_threshold = 0.1
speed_threshold = 0.01
moving_toward_node = false
falling_faster = true
rope_does_nothing = false
large_xy_speed_difference = true
global.total_speed = 0