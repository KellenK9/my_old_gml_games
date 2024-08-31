///desc get_input()
function get_input() {

	rKey = max(keyboard_check(vk_right), keyboard_check(ord("D")),0);
	lKey = max(keyboard_check(vk_left), keyboard_check(ord("A")),0);
	dkey = max(keyboard_check(vk_down), keyboard_check(ord("S")),0);

	xaxis = (rKey - lKey);

	if (gamepad_is_connected(0)){
		rKey = gamepad_button_check(0, gp_padr);
		lKey = gamepad_button_check(0, gp_padl);

	xaxis = max(gamepad_axis_value(0, gp_axisrh,), gamepad_axis_value(0, gp_axislh,), rKey - lKey, 0);
	}


}
