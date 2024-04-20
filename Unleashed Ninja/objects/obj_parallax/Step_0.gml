
// Get the layers by their names in the room editor.
var _p_layer_1 = layer_get_id("Backgrounds_2");
var _p_layer_2 = layer_get_id("Backgrounds_3");
var _p_layer_3 = layer_get_id("Backgrounds_9");
var _p_layer_4 = layer_get_id("Backgrounds_10");

// Move the parallax offset smoothly over time.
parallax_x = lerp(parallax_x, mouse_x - room_width / 2, 0.05);
parallax_y = lerp(parallax_y, mouse_y - room_height / 2, 0.05);

// Move the layers to create the parallax effect.
// layer, -base_offset + mouse * parallax amount * global intensity.
layer_x(_p_layer_1, -50  +  parallax_x * 0.01   * global.parallax_intensity);
layer_x(_p_layer_2, -100 +  parallax_x * 0.02   * global.parallax_intensity);
layer_x(_p_layer_3,        -parallax_x * 0.025  * global.parallax_intensity);
layer_x(_p_layer_4,        -parallax_x * 0.03   * global.parallax_intensity);

layer_y(_p_layer_1, 0   +   parallax_y * 0.005  * global.parallax_intensity);
layer_y(_p_layer_2, 650 +   parallax_y * 0.01   * global.parallax_intensity);
layer_y(_p_layer_3, 10  +  -parallax_y * 0.0125 * global.parallax_intensity);
layer_y(_p_layer_4, 10  +  -parallax_y * 0.015  * global.parallax_intensity);
