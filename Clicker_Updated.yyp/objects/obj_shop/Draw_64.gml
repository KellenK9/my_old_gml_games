/// @description Draws text in shop

draw_set_font(fnt2)

draw_text(1584, 64, "SHOP");

draw_set_font(fnt1);

draw_text(1456, 192, "Increase Glove Strength");
draw_text(1456, 192 + 64*1, "Current: " + string(global.hitprofit));
draw_text(1456, 192 + 64*2, "Cost: " + string(global.cost0));

draw_text(1456, 192 + 64*3, "Hire a Boxer");
draw_text(1456, 192 + 64*4, "Current: " + string(global.boxers));
draw_text(1456, 192 + 64*5, "Cost: " + string(global.cost1));

draw_text(1456, 192 + 64*6, "Increase Value of Coins");
draw_text(1456, 192 + 64*7, "Current: " + string(global.coin_value));
draw_text(1456, 192 + 64*8, "Cost: " + string(global.cost2));

draw_text(1456, 192 + 64*9, "More Falling Coins");
draw_text(1456, 192 + 64*10, "Current: " + string(global.coin_frequency));
draw_text(1456, 192 + 64*11, "Cost: " + string(global.cost3));