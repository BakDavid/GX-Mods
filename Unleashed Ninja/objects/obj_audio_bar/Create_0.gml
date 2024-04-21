// Variable for bars on screen
stage_length = 0;

// Variable for the indivdual bar
staged_id = -1;
staged_output = 0.1;

// Function for setting bar to value
calibrate_bar = function(_output)
{
	// Calibrate bar
	// Sets the output to the parameter
	staged_output = _output;

	// Center point of screen
	var _center_x = obj_camera.wallpaper_width * 0.5;
	var _center_y = obj_camera.wallpaper_height * 0.5;

	// Display dimensions
	var _curr_display_width = camera_get_view_width(view_camera[0]);
	var _curr_display_height = camera_get_view_height(view_camera[0]);

	// Adjusted origin coordinates
	var _origin_x = _center_x - (_curr_display_width * 0.5);
	var _origin_y = _center_y - (_curr_display_height * 0.5);

	// Calculated bar width
	var _bar_width = _curr_display_width * (1 / stage_length);

	// Sets the new coordinates and image scale
	x = _origin_x + staged_id * _bar_width;
	image_xscale = _bar_width;
	y = _origin_y + _curr_display_height - staged_output;
	image_yscale = staged_output;

	// Sets the colour of each rgb value based on the values
	var _red_channel = 255 * (staged_output / obj_audio_visualiser.max_height);
	var _green_channel = (255 * (1 - (staged_id / stage_length * 0.5))) * (1 - (1 / (255 / _red_channel)));
	var _blue_channel = 255 * 0.1;

	// Creates new colour from mixed channels
	var _mixed_channels = make_color_rgb(_red_channel,_green_channel,_blue_channel);

	// Applies new colour to image blend
	image_blend = _mixed_channels;
}