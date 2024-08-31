/// @description Set Lexi Color to Random

colors = [c_aqua, c_fuchsia, c_lime, c_orange, c_yellow]
//color_num = random(array_length_1d(colors))
color_num = (color_num + 1) mod array_length_1d(colors)

self.image_blend = colors[color_num]