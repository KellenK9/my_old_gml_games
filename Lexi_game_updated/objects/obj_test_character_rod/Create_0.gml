/// @description Initialize

deadzone = 0.3
char_speed = 10

burst_enabled = true
move_from_knockback_enabled = true

x_speed = 0
y_speed = 0

firing_timer = 20

dist_from_center = 128-32 //sprite measurement between center and white dot

rotation_velocity = 0
r_acceleration = 5
r_deceleration = 0.98

max_speed = 10
acceleration = 0.5
deceleration = 0.98
//pairs of max_speed, acceleration, and deceleration determine burst movement
//mad pairs:
//50, 5, 0.9 is like teleporting to your destination
//10, 3, 0.99 is like ice
//10, 3, 0.98 is a smooth slide
//10, 1, 0.9 is quick knockback
//10, 0.5, 0.98 is smooth knockback
//10, 0.5, 0.999 is constant slipping and sliding
//20, 0.2, 0.999 is building up speed by button mashing


laser_spawn_distance = 4