///desc get_input()
function get_input() {

	rKey1 = max(keyboard_check(ord("D")), 0);
	lKey1 = max(keyboard_check(ord("A")), 0);
	dKey1 = max(keyboard_check(ord("S")), 0);
	uKey1 = max(keyboard_check(ord("W")), 0);
	rKey2 = max(keyboard_check(vk_right), 0);
	lKey2 = max(keyboard_check(vk_left), 0);
	dKey2 = max(keyboard_check(vk_down), 0);
	uKey2 = max(keyboard_check(vk_up), 0);

	xaxis1 = (rKey1 - lKey1);
	yaxis1 = (dKey1 - uKey1);
	xaxis2 = (rKey2 - lKey2);
	yaxis2 = (dKey2 - uKey2);

	if (gamepad_is_connected(0)){
		rKey = gamepad_button_check(0, gp_padr);
		lKey = gamepad_button_check(0, gp_padl);
		uKey = gamepad_button_check(0, gp_padu);
		dKey = gamepad_button_check(0, gp_padd);
		xaxis1 = gamepad_axis_value(0, gp_axislh)
		yaxis1 = gamepad_axis_value(0, gp_axislv)
		xaxis2 = gamepad_axis_value(0, gp_axisrh)
		yaxis2 = gamepad_axis_value(0, gp_axisrv)
	}


}
