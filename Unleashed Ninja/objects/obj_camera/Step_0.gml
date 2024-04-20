
// Get camera from view 0
var _camera = view_get_camera(0);

// Compute wallpaper scaling based on the mode used
var _window_width = browser_width;
var _window_height = browser_height;
var _scale_x = 1;
var _scale_y = 1;

// Change the scaling depending on the mode.
switch (scale_mode) {
	
	// Only scale the view up.
	case SCALE_MODE.NO_SCALE:
		if (_window_width > wallpaper_width || _window_height > wallpaper_height) {
			_scale_x = max(_window_width / wallpaper_width, _window_height / wallpaper_height);
			_scale_y = _scale_x;
		}
		break;

	// Scale the view up and down.
	case SCALE_MODE.SCALE:
		_scale_x = max(_window_width / wallpaper_width, _window_height / wallpaper_height);
		_scale_y = _scale_x;
		break;

	// Stretch the view to fill the screen without maintaining aspect ratio.c
	case SCALE_MODE.STRETCH:
		_scale_x = _window_width / wallpaper_width;
		_scale_y = _window_height / wallpaper_height;
		break;
}

// Wallpaper size after scaling
var _width_scaled = wallpaper_width * _scale_x;
var _height_scaled = wallpaper_height * _scale_y;

// Position wallpaper based on focus coordinates
focus_x = global.offset_x;
focus_y = global.offset_y;
var _x = round((_width_scaled - _window_width) * focus_x);
var _y = round((_height_scaled - _window_height) * focus_y);

// Apply new camera position and size
camera_set_view_pos(_camera, _x / _scale_x, _y / _scale_y);
camera_set_view_size(_camera, _window_width / _scale_x, _window_height / _scale_y);

// Compute new application surface size
var _surface_width = floor(_window_width * global.render_scale);
var _surface_height = floor(_window_height * global.render_scale);

if (_surface_width > 0 && _surface_height > 0 && _surface_width <= 8192 && _surface_height <= 8192) {
	
	// Also required in Opera GX!
	if (os_type == os_operagx)
		window_set_size(_surface_width, _surface_height);

	// Apply render scale
	if (surface_get_width(application_surface) != _surface_width || surface_get_height(application_surface) != _surface_height)
		surface_resize(application_surface, _surface_width, _surface_height);

	// Keep GUI the same size
	display_set_gui_maximize(global.render_scale, global.render_scale);
}
