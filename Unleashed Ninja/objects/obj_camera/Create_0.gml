
enum SCALE_MODE {
	NO_SCALE,
	SCALE,
	STRETCH
};

// The scaling mode to use to make the wallpaper cover the entire window.
// Use values from the SCALE_MODE enum. Default value is SCALE_MODE.NO_SCALE.
scale_mode = SCALE_MODE.SCALE;

// The width of the wallpaper. Default value is the width of the room.
wallpaper_width = room_width;

// The height of the wallpaper. Default value is the height of the room.
wallpaper_height = room_height;

// The focus point on the X axis. Use values in range 0..1, where 0 is the left
// side of the wallpaper and 1 is the right side. Default value is 0.5 (center).
focus_x = 0.5;

// The focus point on the Y axis. Use values in range 0..1, where 0 is the top
// of the wallpaper and 1 is the bottom. Default value is 0.5 (center).
focus_y = 0.5;
