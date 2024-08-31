/// @description Initialize Variables

randomize()
global.joystick_deadzone = 0.1
global.speed_multiplier = 0.3
global.buffer = 0.01
global.p1_score = 0
global.p2_score = 0
ball_spawn_x = room_width / 2
ball_spawn_y = room_height / 2
instance_create_depth(ball_spawn_x, ball_spawn_y, 0, obj_ball)
global.Font = font_add_sprite_ext(spr_font, "0123456789-abcdefghijklmnopqrstuvwxyz!", true, 1)
global.p1_wins = false
global.p2_wins = false
score_to_win = 3
alarm[1] = -1
text_color_hex = $0fac8b