function get_gamepad_input() {
	//get_gamepad_input()
		xaxis = 0
		yaxis = 0
		xaxis_r = 0
		yaxis_r = 0
		if (gamepad_is_connected(0)){
			xaxis = gamepad_axis_value(0, gp_axislh,)
			yaxis = gamepad_axis_value(0, gp_axislv,)
			xaxis_r = gamepad_axis_value(0, gp_axisrh,)
			yaxis_r = gamepad_axis_value(0, gp_axisrv,)
		
			a_held = gamepad_button_check(0, gp_face1)
			a_pressed = gamepad_button_check_pressed(0, gp_face1)
			b_held = gamepad_button_check(0, gp_face2)
			b_pressed = gamepad_button_check_pressed(0, gp_face2)
			rt_held = max(gamepad_button_check(0, gp_shoulderr), gamepad_button_check(0, gp_shoulderrb))
			rt_pressed = max(gamepad_button_check_pressed(0, gp_shoulderr), gamepad_button_check_pressed(0, gp_shoulderrb))
			lt_held = max(gamepad_button_check(0, gp_shoulderl), gamepad_button_check(0, gp_shoulderlb))
			lt_pressed = max(gamepad_button_check_pressed(0, gp_shoulderl), gamepad_button_check_pressed(0, gp_shoulderlb))
		}


}
