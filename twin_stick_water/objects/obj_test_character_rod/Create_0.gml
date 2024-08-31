/// @description Initialize

deadzone = 0.3
char_speed = 10

burst_enabled = true
move_from_knockback_enabled = true

x_speed = 0
y_speed = 0

firing_timer = 20

dist_from_center = 32-8 //sprite measurement between center and white dot

rotation_velocity = 0
r_acceleration = 5
r_deceleration = 0.98

max_speed = 2
acceleration = 0.1
deceleration = 0.98
//pairs of max_speed, acceleration, and deceleration determine burst movement
//mad pairs:
//(10, 0.5, 0.98): Large quick knockback
//(2, 0.1, 0.98): Normal quick smooth knockback

laser_spawn_distance = 4